use std::format;

use ferrite_session::{either::*, prelude::*};

/*
type myType = Session<ReceiveChannel<ExternalChoice<Either<ReceiveChannel<A, B>, ReceiveChannel<A, C>>>, ReceiveChannel<A, ExternalChoice<Either<B, C>>>>>;

fn myFunc() -> myType { @SYNTHESIZE [] }
*/

type myType<A, B, C> = Session<
    ReceiveChannel<
        ExternalChoice<Either<ReceiveChannel<A, B>, ReceiveChannel<A, C>>>,
        ReceiveChannel<A, ExternalChoice<Either<B, C>>>,
    >,
>;

fn myFunc<A, B, C>() -> myType<A, B, C>
where
    A: Protocol,
    B: Protocol,
    C: Protocol,
{
    receive_channel(|chan_0| {
        receive_channel(|chan_1| {
            offer_choice! { Left => choose!(chan_0, Left, send_channel_to(chan_0, chan_1, forward(chan_0))), Right => choose!(chan_0, Right, send_channel_to(chan_0, chan_1, forward(chan_0))) }
        })
    })
}

fn main() {}
