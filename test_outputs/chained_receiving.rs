use ferrite_session::prelude::*;

// This will not pass rust compilation because A, B, C are not defined
/*
type myType = ReceiveChannel< ReceiveChannel<A, ReceiveChannel<B,C>>, ReceiveChannel<SendChannel<A,B>, C>>;

fn myFunc2() -> Session<myType> { @SYNTHESIZE [] }
*/

// To pass compilation uncomment and generate this polymorphic version
type myType<A, B, C> =
    ReceiveChannel<ReceiveChannel<A, ReceiveChannel<B, C>>, ReceiveChannel<SendChannel<A, B>, C>>;

fn myFunc2<A, B, C>() -> Session<myType<A, B, C>>
where
    A: Protocol,
    B: Protocol,
    C: Protocol,
{
    receive_channel(|chan_0| {
        receive_channel(|chan_1| {
            receive_channel_from(chan_1, |binder_0| {
                send_channel_to(
                    chan_0,
                    binder_0,
                    send_channel_to(chan_0, chan_1, forward(chan_0)),
                )
            })
        })
    })
}

fn main() {}
