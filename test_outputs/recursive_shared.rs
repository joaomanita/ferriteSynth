use std::format;

use ferrite_session::{either::*, prelude::*};

type SharedService = LinearToShared<
    ExternalChoice<Either<SendValue<String, Release>, ReceiveValue<String, Release>>>,
>;

fn shared_provider(arg1: String) -> Session<SharedService> {
    accept_shared_session(
        offer_choice! { Left => send_value(arg1, detach_shared_session(shared_provider(arg1))), Right => receive_value(move |val_0| {detach_shared_session(shared_provider(arg1))}) },
    )
}
// fn shared_provider(arg1: String) -> Session<SharedService>  { accept_shared_session(offer_choice!{ Left => send_value(arg1, detach_shared_session(shared_provider(arg1))), Right => receive_value(move |val_0| {detach_shared_session(shared_provider(val_0))}) }) }

fn rec_provider(
    arg1: String,
) -> Session<Rec<ExternalChoice<Either<SendChannel<SharedService, Z>, End>>>> {
    fix_session(
        offer_choice! { Left => cut::<HList![], _, _, _, _, _, _>(shared_provider(arg1), |binder_28849| {acquire_shared_session(binder_28849, move |chan_1955| {choose!(chan_1955, Left, receive_value_from(chan_1955, move |binder_28853| {release_shared_session(chan_1955, send_channel_from(chan_1955, rec_provider(binder_28853)))}))})}), Right => cut::<HList![], _, _, _, _, _, _>(rec_provider(arg1), |binder_29025| {unfix_session(binder_29025, choose!(binder_29025, Left, receive_channel_from(binder_29025, |binder_29111| {acquire_shared_session(binder_29111, move |chan_2075| {choose!(chan_2075, Left, receive_value_from(chan_2075, move |binder_29175| {release_shared_session(chan_2075, choose!(binder_29025, Right, wait(binder_29025, terminate ())))}))})})))}) },
    )
}
// fn rec_provider(arg1: String) -> Session<Rec<ExternalChoice<Either<SendChannel<SharedService, Z>, End>>>>  { fix_session(offer_choice!{ Left => cut::<HList![], _, _, _, _, _, _>(shared_provider(arg1), |binder_28849| {acquire_shared_session(binder_28849, move |chan_1955| {choose!(chan_1955, Left, receive_value_from(chan_1955, move |binder_28853| {release_shared_session(chan_1955, send_channel_from(chan_1955, rec_provider(binder_28853)))}))})}), Right => terminate () }) }

fn user() -> Session<
    ReceiveChannel<
        Rec<ExternalChoice<Either<SendChannel<SharedService, Z>, End>>>,
        SendValue<String, SendValue<String, End>>,
    >,
> {
    receive_channel(|chan_4170| {
        unfix_session(
            chan_4170,
            choose!(
                chan_4170,
                Left,
                receive_channel_from(chan_4170, |binder_38497| {
                    acquire_shared_session(binder_38497, move |chan_4222| {
                        choose!(
                            chan_4222,
                            Left,
                            receive_value_from(chan_4222, move |binder_38561| {
                                release_shared_session(
                                    chan_4222,
                                    choose!(
                                        chan_4170,
                                        Right,
                                        wait(
                                            chan_4170,
                                            send_value(
                                                binder_38561,
                                                send_value(binder_38561, terminate())
                                            )
                                        )
                                    ),
                                )
                            })
                        )
                    })
                })
            ),
        )
    })
}
// fn user() -> Session<ReceiveChannel<Rec<ExternalChoice<Either<SendChannel<SharedService, Z>, End>>>, SendValue<String, SendValue<String, End>>>>  { receive_channel(|chan_4170| {unfix_session(chan_4170, choose!(chan_4170, Left, receive_channel_from(chan_4170, |binder_38497| {acquire_shared_session(binder_38497, move |chan_4222| {choose!(chan_4222, Left, receive_value_from(chan_4222, move |binder_38561| {release_shared_session(chan_4222, choose!(chan_4170, Right, wait(chan_4170, send_value(binder_38561, send_value(binder_38561, terminate ())))))}))})})))}) }

fn main() {}
