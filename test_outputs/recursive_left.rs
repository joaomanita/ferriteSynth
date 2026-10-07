use std::format;

use ferrite_session::{either::*, prelude::*};

type myType = Rec<ExternalChoice<Either<SendValue<i32, Z>, End>>>;

fn myFunc() -> Session<ReceiveChannel<myType, SendValue<i32, SendValue<i32, End>>>> {
    receive_channel(|chan_0| {
        unfix_session(
            chan_0,
            choose!(
                chan_0,
                Left,
                receive_value_from(chan_0, move |binder_3| {
                    choose!(
                        chan_0,
                        Right,
                        wait(
                            chan_0,
                            send_value(binder_3, send_value(binder_3, terminate()))
                        )
                    )
                })
            ),
        )
    })
}
// fn myFunc() -> Session<ReceiveChannel<myType, SendValue<i32, SendValue<i32, End>>>>  { receive_channel(|chan_0| {unfix_session(chan_0, choose!(chan_0, Left, receive_value_from(chan_0, move |binder_3| {choose!(chan_0, Right, wait(chan_0, send_value(binder_3, send_value(binder_3, terminate ()))))})))}) }

fn main() {}
