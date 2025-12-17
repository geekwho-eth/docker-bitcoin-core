# ==============================================================================
# First Stage: Builder Stage
# Used to download, verify, and extract Bitcoin Core binaries
# ==============================================================================
FROM registry.access.redhat.com/ubi9/ubi AS builder

LABEL maintainer="GeekWho <geekwho_eth@outlook.com>"
LABEL version="1.0"
LABEL description="A bitcoin-core docker image"

# 1. Install build dependencies:
#    - ca-certificates, curl, git, gnupg, wget: Required for verification and downloading
#    - python3: Required to run the verify.py script
RUN dnf update -y && \
    dnf install -y ca-certificates git gnupg python3 wget && \
    dnf clean all && \
    rm -rf /var/cache/dnf /tmp/* /var/tmp/*

# ------------------------------------------------------------------------------
# The following ARG/ENV and verification/extraction steps remain unchanged
# as they are related to architecture and git/curl logic.
# ------------------------------------------------------------------------------
ARG TARGETPLATFORM
ENV BITCOIN_VERSION=30.0
ENV SIGS_REPO_URL="https://github.com/bitcoin-core/guix.sigs.git"
ENV SIGS_CLONE_DIR="guix.sigs"
ENV VERIFY_SCRIPT_URL="https://raw.githubusercontent.com/bitcoin/bitcoin/master/contrib/verify-binaries/verify.py"
ENV TMPDIR="/tmp/bitcoin_verify_binaries"

# Execute verification and extraction logic
# Note: The TARGETPLATFORM conversion logic is maintained as it targets Bitcoin compilation artifacts.
RUN set -ex \
    && if [ "${TARGETPLATFORM}" = "linux/amd64" ]; then export TARGETPLATFORM=x86_64-linux-gnu; fi \
    && if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then export TARGETPLATFORM=aarch64-linux-gnu; fi \
    && if [ "${TARGETPLATFORM}" = "linux/arm/v7" ]; then export TARGETPLATFORM=arm-linux-gnueabihf; fi \
    && git clone ${SIGS_REPO_URL} ${SIGS_CLONE_DIR} \
    && gpg --import "${SIGS_CLONE_DIR}"/builder-keys/* \
    && curl -o verify.py ${VERIFY_SCRIPT_URL} \
    && chmod +x verify.py \
    && ./verify.py \
    --min-good-sigs 6 pub "${BITCOIN_VERSION}-linux" \
    && tar -xzf "${TMPDIR}.${BITCOIN_VERSION}-linux/bitcoin-${BITCOIN_VERSION}-${TARGETPLATFORM}.tar.gz" -C /opt \
    && rm -rf ${SIGS_CLONE_DIR} \
    && rm -rf ${TMPDIR} \
    && rm -rf /opt/bitcoin-${BITCOIN_VERSION}/bin/bitcoin-qt


# ==============================================================================
# Second Stage: Final Image
# ------------------------------------------------------------------------------
FROM registry.access.redhat.com/ubi9/ubi

ARG UID=101
ARG GID=101

# Set environment variables
ENV USER=bitcoin
ENV BITCOIN_DATA=/home/bitcoin/.bitcoin
ENV BITCOIN_VERSION=30.0
ENV PATH=/opt/bitcoin-${BITCOIN_VERSION}/bin:$PATH

RUN dnf update -y && \
    dnf install -y wget shadow && \
    \
    # 2. Download EPEL repository RPM package
    # Note: The URL here points to the EPEL RPM for EL 9 (Enterprise Linux 9)
    EPEL_RPM_URL="https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm" && \
    wget -O /tmp/epel-release.rpm $EPEL_RPM_URL && \
    \
    # 3. Install the EPEL repository
    # Using dnf install on the RPM automatically handles dependencies and GPG keys
    dnf install -y /tmp/epel-release.rpm && \
    \
    # 5. Clean up downloaded files and cache
    dnf clean all && \
    rm -rf /var/cache/dnf /tmp/* /var/tmp/*

# 1. Install final dependencies and create user
#    - shadow: Contains useradd and groupadd commands
RUN dnf update -y && \
    groupadd --system --gid ${GID} ${USER} && \
    useradd --system --create-home --no-log-init -u ${UID} -g ${GID} ${USER} && \
    dnf clean all && \
    rm -rf /var/cache/dnf /tmp/* /var/tmp/*

# Copy the verified binaries from the builder stage
COPY --from=builder /opt/bitcoin-${BITCOIN_VERSION} /opt/bitcoin-${BITCOIN_VERSION}

# Copy the entrypoint script (assuming docker-entrypoint.sh exists locally)
COPY docker-entrypoint.sh /entrypoint.sh

# Ensure the bitcoin user has execution permissions for binaries and write permissions for data directory
RUN chown -R ${USER}:${USER} /opt/bitcoin-${BITCOIN_VERSION} && \
    mkdir -p ${BITCOIN_DATA} && \
    chown -R ${USER}:${USER} ${BITCOIN_DATA} && \
    chmod +x /entrypoint.sh

# Use the installed bitcoind to verify the version before setting the USER
RUN bitcoind -version | grep "Bitcoin Core daemon version v${BITCOIN_VERSION}"

USER ${USER} # Switch the default user to non-root

VOLUME ["/home/bitcoin/.bitcoin"]
EXPOSE 8332 8333 18332 18333 18443 18444 38333 38332

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bitcoind"]