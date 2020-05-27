# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# Add example bin
#export PATH=/path/to/bin:$PATH

# Add GOBIN
export GOBIN=$HOME/go/bin
export PATH=$GOBIN:$PATH

# Add PIP binaries
export PATH=$HOME/.local/bin:$PATH

# Add cargo bin
export PATH=$HOME/.cargo/bin:$PATH

# Add Rust/Cargo
source $HOME/.cargo/env
