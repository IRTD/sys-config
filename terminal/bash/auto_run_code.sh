GOMOD="$PWD/go.mod"
CARGO="$PWD/Cargo.toml"
HASKELL="$PWD/main.hs"

if [ -f "$GOMOD" ]; then
    go run .
fi

if [ -f "$CARGO" ]; then
    cargo run
fi

if [ -f "$HASKELL" ]; then
    runghc "$HASKELL"
fi


