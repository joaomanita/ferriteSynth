use ferrite_session::{internal::protocol::Lock, prelude::*};

type Counter = LinearToShared<SendValue<u64, Release>>;

fn shared_provider_1(count: u64) -> Session<Counter> {
    accept_shared_session(send_value(
        count,
        detach_shared_session(shared_provider_1(count)),
    ))
}
// fn shared_provider_1(count: u64) -> Session<Counter>  { accept_shared_session(send_value(count, detach_shared_session(shared_provider_1(count)))) }

fn shared_client() -> Session<ReceiveChannel<Counter, SendValue<u64, End>>> {
    receive_channel(|chan_6| {
        acquire_shared_session(chan_6, move |chan_8| {
            receive_value_from(chan_8, move |binder_11| {
                release_shared_session(chan_8, send_value(binder_11, terminate()))
            })
        })
    })
}
// fn shared_client() -> Session<ReceiveChannel<Counter, SendValue<u64, End>>>  { receive_channel(|chan_6| {acquire_shared_session(chan_6, move |chan_8| {receive_value_from(chan_8, move |binder_11| {release_shared_session(chan_8, send_value(binder_11, terminate ()))})})}) }
