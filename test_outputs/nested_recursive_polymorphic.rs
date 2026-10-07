use ferrite_session::{either::*, prelude::*};

type Stream<T> = Rec<
    ExternalChoice<
        Either<Rec<InternalChoice<Either<SendValue<T, Z>, S<Z>>>>, ReceiveValue<T, End>>,
    >,
>;

fn producer<T>(arg1: T) -> Session<Stream<T>>
where
    T: Protocol,
{
    fix_session(
        offer_choice! { Left => fix_session(offer_case!(Right, producer(forward(arg1)))), Right => receive_value(move |val_0| {cut::<HList![], _, _, _, _, _, _>(producer(forward(val_0)), |binder_195| {unfix_session(binder_195, choose!(binder_195, Right, send_value_to(binder_195, val_0, wait(binder_195, terminate ()))))})}) },
    )
}
// fn producer<T>(arg1: T) -> Session<Stream<T>> where T: Protocol { fix_session(offer_choice!{ Left => fix_session(offer_case!(Right, producer(forward(arg1)))), Right => receive_value(move |val_0| {terminate ()}) }) }

fn user(
    arg2: String,
) -> Session<
    ReceiveChannel<
        Rec<
            ExternalChoice<
                Either<
                    Rec<InternalChoice<Either<SendValue<String, Z>, S<Z>>>>,
                    ReceiveValue<String, End>,
                >,
            >,
        >,
        End,
    >,
> {
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
// fn user(arg2: String) -> Session<ReceiveChannel<Rec<ExternalChoice<Either<Rec<InternalChoice<Either<SendValue<String, Z>, S<Z>>>>, ReceiveValue<String, End>>>>, End>>  { receive_channel(|chan_0| {unfix_session(chan_0, choose!(chan_0, Right, send_value_to(chan_0, arg2, wait(chan_0, terminate ()))))}) }

#[tokio::main]
pub async fn main(arg3: String) {
    run_session(cut::<HList![], _, _, _, _, _, _>(
        user(arg3),
        |binder_255| {
            cut::<AllLeft, _, _, _, _, _, _>(producer(binder_255), |binder_303| {
                unfix_session(
                    binder_303,
                    choose!(
                        binder_303,
                        Right,
                        send_value_to(binder_303, arg3, wait(binder_303, terminate()))
                    ),
                )
            })
        },
    ))
    .await
}
// #[tokio::main] pub async fn main(arg3: String) { run_session(cut::<HList![], _, _, _, _, _, _>(user(arg3), |binder_255| {cut::<AllLeft, _, _, _, _, _, _>(producer(binder_255), |binder_303| {unfix_session(binder_303, choose!(binder_303, Right, send_value_to(binder_303, arg3, wait(binder_303, terminate ()))))})})).await }
