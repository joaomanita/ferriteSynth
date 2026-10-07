use ferrite_session::prelude::*;

/*
type myType = ReceiveChannel< LinearToShared<ReceiveChannel<A, B>>, ReceiveChannel<LinearToShared<A>, LinearToShared<B>>>;

fn myFunc2() -> Session<myType> { @SYNTHESIZE [] }
*/

type myType<A, B> = ReceiveChannel<
    LinearToShared<ReceiveChannel<A, SendChannel<B, Release>>>,
    ReceiveChannel<A, B>,
>;

fn myFunc2<A, B>() -> Session<myType<A, B>>
where
    A: Protocol,
    B: Protocol,
{
    receive_channel(|chan_0| {
        receive_channel(|chan_1| {
            acquire_shared_session(chan_0, move |chan_3| {
                send_channel_to(
                    chan_3,
                    chan_1,
                    receive_channel_from(chan_3, |binder_3| {
                        release_shared_session(chan_3, forward(binder_3))
                    }),
                )
            })
        })
    })
}
// fn myFunc2<A, B>() -> Session<myType<A, B>> where A: Protocol, B: Protocol { receive_channel(|chan_0| {receive_channel(|chan_1| {acquire_shared_session(chan_0, move |chan_3| {send_channel_to(chan_3, chan_1, receive_channel_from(chan_3, |binder_3| {release_shared_session(chan_3, forward(binder_3))}))})})}) }

fn main() {}
