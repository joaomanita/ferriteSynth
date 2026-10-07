use std::format;

use ferrite_session::prelude::*;

/*
type myType = Session<ReceiveChannel<A, B>>;

fn myFunc(arg1: myType: 1, arg2: A: 1) -> Session<B> { @SYNTHESIZE [] }
*/

type myType = Session<ReceiveChannel<A, B>>;

fn myFunc(arg1: Session<ReceiveChannel<A, B>>, arg2: A) -> Session<B> {
    cut::<AllLeft, _, _, _, _, _, _>(arg1, |binder_3| {
        send_channel_to(binder_3, arg2, forward(binder_3))
    })
}

fn main() {}
