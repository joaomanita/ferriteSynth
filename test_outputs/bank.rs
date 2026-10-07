use ferrite_session::{either::*, prelude::*};

define_choice! {
    BankOps;
    Deposit: ReceiveValue<i32, Z>,
    Withdraw: SendValue<i32, ReceiveValue<i32, Z>>,
    Terminate: End
}

type RecBankOps = Rec<ExternalChoice<BankOps>>;

fn bankops(arg1: i32) -> Session<Rec<ExternalChoice<BankOps>>> {
    fix_session(
        offer_choice! { Deposit => receive_value(move |val_0| {bankops(val_0)}), Withdraw => send_value(arg1, receive_value(move |val_2| {bankops(val_2)})), Terminate => cut::<HList![], _, _, _, _, _, _>(bankops(arg1), |binder_15| {unfix_session(binder_15, choose!(binder_15, Deposit, send_value_to(binder_15, arg1, unfix_session(binder_15, choose!(binder_15, Terminate, wait(binder_15, terminate ()))))))}) },
    )
}
// fn bankops(arg1: i32) -> Session<Rec<ExternalChoice<BankOps>>>  { fix_session(offer_choice!{ Deposit => receive_value(move |val_0| {bankops(val_0)}), Withdraw => send_value(arg1, receive_value(move |val_2| {bankops(val_2)})), Terminate => terminate () }) }

fn bank_session(
    withdraw_value: i32,
) -> Session<ReceiveValue<String, Rec<ExternalChoice<BankOps>>>> {
    receive_value(move |val_3| {
        fix_session(
            offer_choice! { Deposit => receive_value(move |val_24| {bankops(val_24)}), Withdraw => send_value(withdraw_value, receive_value(move |val_38| {bankops(val_38)})), Terminate => cut::<HList![], _, _, _, _, _, _>(bankops(withdraw_value), |binder_49| {unfix_session(binder_49, choose!(binder_49, Terminate, wait(binder_49, terminate ())))}) },
        )
    })
}
// fn bank_session(withdraw_value: i32) -> Session<ReceiveValue<String, Rec<ExternalChoice<BankOps>>>>  { receive_value(move |val_3| {fix_session(offer_choice!{ Deposit => receive_value(move |val_24| {bankops(val_24)}), Withdraw => send_value(withdraw_value, receive_value(move |val_38| {bankops(val_38)})), Terminate => cut::<HList![], _, _, _, _, _, _>(bankops(withdraw_value), |binder_49| {unfix_session(binder_49, choose!(binder_49, Withdraw, receive_value_from(binder_49, move |binder_50| {send_value_to(binder_49, binder_50, unfix_session(binder_49, choose!(binder_49, Terminate, wait(binder_49, terminate ()))))})))}) })}) }

fn client_session(
    myId: String,
    depositAmt: i32,
) -> Session<ReceiveChannel<ReceiveValue<String, Rec<ExternalChoice<BankOps>>>, End>> {
    receive_channel(|chan_0| {
        send_value_to(
            chan_0,
            myId,
            unfix_session(
                chan_0,
                choose!(
                    chan_0,
                    Withdraw,
                    receive_value_from(chan_0, move |binder_51| {
                        send_value_to(
                            chan_0,
                            binder_51,
                            unfix_session(
                                chan_0,
                                choose!(chan_0, Terminate, wait(chan_0, terminate())),
                            ),
                        )
                    })
                ),
            ),
        )
    })
}
// fn client_session(myId: String, depositAmt: i32) -> Session<ReceiveChannel<ReceiveValue<String, Rec<ExternalChoice<BankOps>>>, End>>  { receive_channel(|chan_0| {send_value_to(chan_0, myId, unfix_session(chan_0, choose!(chan_0, Deposit, send_value_to(chan_0, depositAmt, unfix_session(chan_0, choose!(chan_0, Terminate, wait(chan_0, terminate ())))))))}) }

fn main() {}
