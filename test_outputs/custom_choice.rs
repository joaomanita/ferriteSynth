use ferrite_session::{either::*, prelude::*};

define_choice! {
    FooBarBaz;
    Foo: SendValue<String, End>,
    Bar: ReceiveValue<u64, End>,
    Baz: End
}

fn provider(arg1: String) -> Session<ExternalChoice<FooBarBaz>> {
    offer_choice! { Foo => send_value(arg1, terminate ()), Bar => receive_value(move |val_0| {terminate ()}), Baz => terminate () }
}

fn client() -> Session<ReceiveChannel<ExternalChoice<FooBarBaz>, End>> {
    receive_channel(|chan_0| choose!(chan_0, Baz, wait(chan_0, terminate())))
}
// fn client() -> Session<ReceiveChannel<ExternalChoice<FooBarBaz>, End>>  { receive_channel(|chan_0| {choose!(chan_0, Foo, receive_value_from(chan_0, move |binder_1| {wait(chan_0, terminate ())}))}) }

/*
fn main(arg1:String: 1) { @SYNTHESIZE [use provider, client;] }
*/

fn main() {}
