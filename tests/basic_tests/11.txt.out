use std::format;

use ferrite_session::prelude::*;

type myType = ReceiveChannel<
    ExternalChoice<Either<ReceiveChannel<A, B>, ReceiveChannel<C, D>>>,
    ReceiveChannel<SendChannel<A, C>, SendChannel<B, D>>,
>;

// couldnt synthesize function
