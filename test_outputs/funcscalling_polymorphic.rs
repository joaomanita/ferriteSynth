use ferrite_session::{either::*, prelude::*};

type myType<A, B, C> = ReceiveChannel<
    ExternalChoice<Either<ReceiveChannel<A, B>, ReceiveChannel<A, C>>>,
    ReceiveChannel<A, ExternalChoice<Either<SendChannel<B, End>, SendChannel<C, End>>>>,
>;

fn myFunc<A, B, C>() -> Session<myType<A, B, C>>
where
    A: Protocol,
    B: Protocol,
    C: Protocol,
{
    receive_channel(|chan_0| {
        receive_channel(|chan_1| {
            offer_choice! { Left => choose!(chan_0, Left, send_channel_to(chan_0, chan_1, send_channel_from(chan_0, terminate ()))), Right => choose!(chan_0, Right, send_channel_to(chan_0, chan_1, send_channel_from(chan_0, terminate ()))) }
        })
    })
}

fn user<A, B, C>(
    arg1: A,
    arg2: ExternalChoice<Either<ReceiveChannel<A, B>, ReceiveChannel<A, C>>>,
) -> Session<ReceiveChannel<myType<A, B, C>, SendChannel<C, End>>>
where
    A: Protocol,
    B: Protocol,
    C: Protocol,
{
    receive_channel(|chan_2| {
        send_channel_to(
            chan_2,
            arg2,
            send_channel_to(
                chan_2,
                arg1,
                choose!(
                    chan_2,
                    Right,
                    receive_channel_from(chan_2, |binder_47| {
                        wait(chan_2, send_channel_from(binder_47, terminate()))
                    })
                ),
            ),
        )
    })
}
// fn user<A, B, C>(arg1: A, arg2: ExternalChoice<Either<ReceiveChannel<A, B>, ReceiveChannel<A, C>>>) -> Session<ReceiveChannel<myType<A, B, C>, SendChannel<C, End>>> where A: Protocol, B: Protocol, C: Protocol { receive_channel(|chan_2| {send_channel_to(chan_2, arg2, send_channel_to(chan_2, arg1, choose!(chan_2, Right, receive_channel_from(chan_2, |binder_15| {wait(chan_2, send_channel_from(binder_15, terminate ()))}))))}) }

fn main<D, E, F>(
    arg1: D,
    arg2: ExternalChoice<Either<ReceiveChannel<D, E>, ReceiveChannel<D, F>>>,
) -> Session<SendChannel<F, End>>
where
    D: Protocol,
    E: Protocol,
    F: Protocol,
{
    cut::<HList![], _, _, _, _, _, _>(myFunc(), |binder_55| {
        send_channel_to(
            binder_55,
            arg2,
            send_channel_to(
                binder_55,
                user,
                choose!(
                    binder_55,
                    Left,
                    receive_channel_from(binder_55, |binder_65| {
                        wait(binder_55, send_channel_from(binder_65, terminate()))
                    })
                ),
            ),
        )
    })
}
// fn main<D, E, F>(arg1: D, arg2: ExternalChoice<Either<ReceiveChannel<D, E>, ReceiveChannel<D, F>>>) -> Session<SendChannel<F, End>> where D: Protocol, E: Protocol, F: Protocol { cut::<HList![], _, _, _, _, _, _>(myFunc(), |binder_55| {send_channel_to(binder_55, arg2, send_channel_to(binder_55, user, choose!(binder_55, Left, receive_channel_from(binder_55, |binder_65| {wait(binder_55, receive_channel_from(binder_65, |binder_67| {wait(binder_65, send_channel_from(binder_67, terminate ()))}))}))))}) }
