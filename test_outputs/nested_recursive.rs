use ferrite_session::{either::*, prelude::*};

type Stream = Rec<
    ExternalChoice<
        Either<Rec<InternalChoice<Either<SendValue<String, Z>, S<Z>>>>, ReceiveValue<String, End>>,
    >,
>;

fn producer(arg1: String) -> Session<Stream> {
    fix_session(
        offer_choice! { Left => fix_session(offer_case!(Right, producer(arg1))), Right => receive_value(move |val_0| {cut::<HList![], _, _, _, _, _, _>(producer(val_0), |binder_37| {unfix_session(binder_37, choose!(binder_37, Right, send_value_to(binder_37, val_0, wait(binder_37, terminate ()))))})}) },
    )
}
// fn producer(arg1: String) -> Session<Stream>  { fix_session(offer_choice!{ Left => fix_session(offer_case!(Right, producer(arg1))), Right => receive_value(move |val_0| {terminate ()}) }) }

fn user(arg2: String) -> Session<ReceiveChannel<Stream, End>> {
    receive_channel(|chan_0| {
        unfix_session(
            chan_0,
            choose!(
                chan_0,
                Right,
                send_value_to(chan_0, arg2, wait(chan_0, terminate()))
            ),
        )
    })
}
// fn user(arg2: String) -> Session<ReceiveChannel<Stream, End>>  { receive_channel(|chan_0| {unfix_session(chan_0, choose!(chan_0, Right, send_value_to(chan_0, arg2, wait(chan_0, terminate ()))))}) }

/*
fn main(arg3: String: 2) { @SYNTHESIZE [use producer, user;] }
*/

fn main() {}
