// @generated

extern crate test;

use tls_api::TlsAcceptor;
use tls_api::TlsConnector;

#[bench]
fn bench_1(b: &mut test::Bencher) {
    tls_api_test::benches::bench_1::<tls_api_rustls::TlsConnector, tls_api_rustls::TlsAcceptor>(b)
}

#[bench]
fn bench_1_dyn(b: &mut test::Bencher) {
    tls_api_test::benches::bench_1_dyn(
        tls_api_rustls::TlsConnector::TYPE_DYN,
        tls_api_rustls::TlsAcceptor::TYPE_DYN,
        b,
    )
}
