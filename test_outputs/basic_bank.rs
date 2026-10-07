use ferrite_session::prelude::*;

define_choice! {
    BankOps;
    Deposit: ReceiveValue<i32, End>,
    Withdraw: SendValue<i32, ReceiveValue<i32, End>>,
    Terminate: End
}

fn bankops(arg1: i32) -> Session<ExternalChoice<BankOps>> {
    offer_choice! { Deposit => receive_value(move |val_0| {terminate ()}), Withdraw => send_value(arg1, receive_value(move |val_2| {terminate ()})), Terminate => terminate () }
}

fn bank_session(withdraw_value: i32) -> Session<ReceiveValue<String, ExternalChoice<BankOps>>> {
    receive_value(move |val_7| {
        offer_choice! { Deposit => receive_value(move |val_8| {terminate ()}), Withdraw => send_value(withdraw_value, receive_value(move |val_10| {terminate ()})), Terminate => terminate () }
    })
}

fn client_session(
    myId: String,
    depositAmt: i32,
) -> Session<ReceiveChannel<ReceiveValue<String, ExternalChoice<BankOps>>, End>> {
    receive_channel(|chan_0| {
        send_value_to(
            chan_0,
            myId,
            choose!(
                chan_0,
                Withdraw,
                receive_value_from(chan_0, move |binder_0| {
                    send_value_to(chan_0, binder_0, wait(chan_0, terminate()))
                })
            ),
        )
    })
}
// fn client_session(myId: String, depositAmt: i32) -> Session<ReceiveChannel<ReceiveValue<String, ExternalChoice<BankOps>>, End>>  { receive_channel(|chan_0| {send_value_to(chan_0, myId, choose!(chan_0, Deposit, send_value_to(chan_0, depositAmt, wait(chan_0, terminate ()))))}) }

fn main() {}
