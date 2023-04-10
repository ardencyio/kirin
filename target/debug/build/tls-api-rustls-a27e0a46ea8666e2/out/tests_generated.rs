// @generated

use tls_api::TlsAcceptor;
use tls_api::TlsConnector;

#[test]
fn version() {
    tls_api_test::test_version::<tls_api_rustls::TlsConnector, tls_api_rustls::TlsAcceptor>();
}

#[test]
fn google() {
    tls_api_test::test_google::<tls_api_rustls::TlsConnector>();
}

#[test]
fn connect_bad_hostname() {
    tls_api_test::connect_bad_hostname::<tls_api_rustls::TlsConnector, _>(drop);
}

#[test]
fn connect_bad_hostname_ignored() {
    tls_api_test::connect_bad_hostname_ignored::<tls_api_rustls::TlsConnector>();
}

#[test]
fn client_server_der() {
    tls_api_test::test_client_server_der::<
        tls_api_rustls::TlsConnector,
        tls_api_rustls::TlsAcceptor,
    >();
}

#[test]
fn client_server_dyn_der() {
    tls_api_test::test_client_server_dyn_der(
        tls_api_rustls::TlsConnector::TYPE_DYN,
        tls_api_rustls::TlsAcceptor::TYPE_DYN,
    );
}

#[test]
fn client_server_pkcs12() {
    tls_api_test::test_client_server_pkcs12::<
        tls_api_rustls::TlsConnector,
        tls_api_rustls::TlsAcceptor,
    >();
}

#[test]
fn alpn() {
    tls_api_test::test_alpn::<tls_api_rustls::TlsConnector, tls_api_rustls::TlsAcceptor>()
}
