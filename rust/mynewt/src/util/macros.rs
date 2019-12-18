//!  Mynewt Macros for Rust. Note that macros defined locally should be called with `$crate::`, like `$crate::parse`.
//!  This works with Rust compiler versions 1.30 and later.  See https://doc.rust-lang.org/stable/edition-guide/rust-2018/macros/macro-changes.html
//!  To see the expanded macros: `cargo rustc -- -Z unstable-options --pretty expanded`
 
///////////////////////////////////////////////////////////////////////////////
//  Utility Macros

///  Return a const struct that has all fields set to 0. Used for initialising static mutable structs like `os_task`.
///  `fill_zero!(os::os_task)` expands to
///  ```
/// unsafe { 
///	::core::mem::transmute::
///	<
///	  [
///		u8; 
///		::core::mem::size_of::<os::os_task>()
///	  ], 
///	  os::os_task
///	>
///	(
///	  [
///		0; 
///		::core::mem::size_of::<os::os_task>()
///	  ]
///	) 
/// }
///  ```
#[macro_export]
macro_rules! fill_zero {
  ($($tts:tt)*) => {
    unsafe { 
      ::core::mem::transmute::
      <
      [
          u8; 
          ::core::mem::size_of::<$($tts)*>()
      ], 
      $($tts)*
      >
      (
      [
          0; 
          ::core::mem::size_of::<$($tts)*>()
      ]
      ) 
    }      
  };
}

///  Macro that takes an identifier and returns a `[u8]` containing the identifier, terminated by 0.
///  Used to convert an identifier to a C null-terminated string.
#[macro_export]
macro_rules! stringify_null {
  ($key:ident) => {  //  If $key is identifier...
    concat!(
      stringify!($key),
      "\0"
    )
  };
}

///  Macro to dump all tokens received as a literal string, e.g.
///  `d!(a b c)` returns `"a b c"`
#[macro_export]
macro_rules! d {
  //  This rule matches zero or more tokens.
  ($($token:tt)*) => {
    //  For all matched tokens, convert into a string.
    stringify!($($token)*)
  };
}

///  Macro to display the token being parsed and the remaining tokens
#[macro_export]
macro_rules! nx {
  (($($current:tt)*), ($($next:tt)*), ($($rest:tt)*)) => {
    concat!(
      " >> ",
      stringify!($($current)*), 
      " >> ",
      stringify!($($next)*), 
      " >> ",
      stringify!($($rest)*)
    );
  };
}
