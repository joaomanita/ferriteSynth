use std::format;

use ferrite_session::{either::*, prelude::*};

type myType<A, B> = ExternalChoice<Either<A, B>>;

fn provider<A, B>(arg1: Session<A>, arg2: Session<B>) -> Session<myType<A, B>>
where
    A: Protocol,
    B: Protocol,
{
    offer_choice! { Left => cut::<AllLeft, _, _, _, _, _, _>(arg1, |binder_3| {forward(binder_3)}), Right => cut::<AllLeft, _, _, _, _, _, _>(arg2, |binder_25| {forward(binder_25)}) }
}

fn main() {}
