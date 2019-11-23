#[macro_use] extern crate rustler;

use rustler::{Encoder, Env, Error, Term};

mod atoms {
    rustler_atoms! {
        atom ok;
        atom error;
        //atom __true__ = "true";
        //atom __false__ = "false";
    }
}

rustler::rustler_export_nifs! {
    "Elixir.ExTiberius.Nif",
    [
        ("connect", 1, connect)
    ],
    None
}

fn connect<'a>(env: Env<'a>, args: &[Term<'a>]) -> Result<Term<'a>, Error> {
    let connection_string: String = args[0].decode()?;

    Ok((atoms::error(), connection_string).encode(env))
}
