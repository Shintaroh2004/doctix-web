# Dockerfile
FROM rust:latest as builder
WORKDIR /home/rust
COPY . .
RUN cargo build --release

FROM ubuntu:latest
WORKDIR /doctix
COPY --from=builder /home/rust/target/release/doctix . 
EXPOSE 8080
ENTRYPOINT [ "./doctix" ] 