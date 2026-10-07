use std::format;

use ferrite_session::prelude::*;

/*
type myType = ReceiveChannel<A, B>;

fn myFunc(arg1: myType: 1, arg2: A: 1) -> Session<B> {}

fn myFunc2() -> Session<ReceiveChannel<myType, ReceiveChannel<A, SendChannel<B, End>>>> { @SYNTHESIZE [use myFunc;] }
*/

type myType<A, B> = ReceiveChannel<A, B>;

fn myFunc<A, B>(arg1: myType<A, B>, arg2: A) -> Session<B>
where
    A: Protocol,
    B: Protocol,
{
}

fn myFunc2<A, B>() -> Session<ReceiveChannel<myType<A, B>, ReceiveChannel<A, SendChannel<B, End>>>>
where
    A: Protocol,
    B: Protocol,
{
    receive_channel(|chan_0| {
        receive_channel(|chan_1| {
            cut::<AllLeft, _, _, _, _, _, _>(myFunc(chan_0, chan_1), |binder_3| {
                send_channel_from(binder_3, terminate())
            })
        })
    })
}
// fn myFunc2<A, B>() -> Session<ReceiveChannel<myType<A, B>, ReceiveChannel<A, SendChannel<B, End>>>> where A: Protocol, B: Protocol { receive_channel(|chan_0| {receive_channel(|chan_1| {cut::<AllLeft, _, _, _, _, _, _>(myFunc(chan_0, chan_1), |binder_3| {receive_channel_from(binder_3, |binder_5| {wait(binder_3, send_channel_from(binder_5, terminate ()))})})})}) }

fn main() {}
