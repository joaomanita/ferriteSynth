use std::{collections::VecDeque, future::Future, time::Duration};

use ferrite_session::prelude::*;
use tokio::time::sleep;

// Example implementation of Rust channels using shared channels

define_choice! {
    ActionsReceiver;
    Next: SendValue<i32, Z>,
    Close: End
}

define_choice! {
    ActionsChannel;
    ReceiveNext: ReceiveValue<i32, Release>,
    SendNext: SendValue<i32, Release>
}

type Receiver = Rec<ExternalChoice<ActionsReceiver>>;

type Channel = LinearToShared<ExternalChoice<ActionsChannel>>;

fn make_channel(val: i32) -> Session<LinearToShared<ExternalChoice<ActionsChannel>>> {
    accept_shared_session(
        offer_choice! { ReceiveNext => receive_value(move |val_0| {detach_shared_session(make_channel(val))}), SendNext => send_value(val, detach_shared_session(make_channel(val))) },
    )
}
// fn make_channel(val: i32) -> Session<LinearToShared<ExternalChoice<ActionsChannel>>>  { accept_shared_session(offer_choice!{ ReceiveNext => receive_value(move |val_0| {detach_shared_session(make_channel(val_0))}), SendNext => send_value(val, detach_shared_session(make_channel(val))) }) }

fn make_receiver(val: i32) -> Session<Rec<ExternalChoice<ActionsReceiver>>> {
    fix_session(
        offer_choice! { Next => send_value(val, make_receiver(val)), Close => cut::<HList![], _, _, _, _, _, _>(make_receiver(val), |binder_29| {unfix_session(binder_29, choose!(binder_29, Next, receive_value_from(binder_29, move |binder_31| {unfix_session(binder_29, choose!(binder_29, Close, wait(binder_29, terminate ())))})))}) },
    )
}
// fn make_receiver(val: i32) -> Session<Rec<ExternalChoice<ActionsReceiver>>>  { fix_session(offer_choice!{ Next => send_value(val, make_receiver(val)), Close => terminate () }) }
