#
# ~/.bash_profile
#

# Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"

[[ -f ~/.bashrc ]] && . ~/.bashrc
#if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
#    exec startx
#fi
