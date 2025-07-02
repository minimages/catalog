# minimages

Minimal multi-arch container images for various tools based on Wolfi.

## Images
<table>
<tr>
<th>Image</th>
<th>Tags</th>
</tr>
<tr>

<td>
    <a href="//ghcr.io/minimages/aws-cli"><code>ghcr.io/minimages/aws-cli</code></a>
</td>

<td>
    <code>2</code>
    <code>2-dev</code>
    <code>2.22</code>
    <code>2.22-dev</code>
    <code>2.22.13</code>
    <code>2.22.13-dev</code>
    <code>latest</code>
    <code>latest-dev</code>
</td>
</tr>

<tr>

<td>
    <a href="//ghcr.io/minimages/curl"><code>ghcr.io/minimages/curl</code></a>
</td>

<td>
    <code>8</code>
    <code>8-dev</code>
    <code>8.14</code>
    <code>8.14-dev</code>
    <code>8.14.1</code>
    <code>8.14.1-dev</code>
    <code>latest</code>
    <code>latest-dev</code>
</td>
</tr>

<tr>

<td>
    <a href="//ghcr.io/minimages/docker-cli"><code>ghcr.io/minimages/docker-cli</code></a>
</td>

<td>
    <code>28</code>
    <code>28-dev</code>
    <code>28.3</code>
    <code>28.3-dev</code>
    <code>28.3.0</code>
    <code>28.3.0-dev</code>
    <code>latest</code>
    <code>latest-dev</code>
</td>
</tr>

<tr>

<td>
    <a href="//ghcr.io/minimages/gcloud"><code>ghcr.io/minimages/gcloud</code></a>
</td>

<td>
    <code>528</code>
    <code>528-dev</code>
    <code>latest</code>
    <code>latest-dev</code>
</td>
</tr>

<tr>

<td>
    <a href="//ghcr.io/minimages/git"><code>ghcr.io/minimages/git</code></a>
</td>

<td>
    <code>2</code>
    <code>2-dev</code>
    <code>2.50</code>
    <code>2.50-dev</code>
    <code>2.50.0</code>
    <code>2.50.0-dev</code>
    <code>latest</code>
    <code>latest-dev</code>
</td>
</tr>

<tr>

<td>
    <a href="//ghcr.io/minimages/kubectl"><code>ghcr.io/minimages/kubectl</code></a>
</td>

<td>
    <code>1</code>
    <code>1-dev</code>
    <code>1.33</code>
    <code>1.33-dev</code>
    <code>1.33.2</code>
    <code>1.33.2-dev</code>
    <code>latest</code>
    <code>latest-dev</code>
</td>
</tr>

<tr>

<td>
    <a href="//ghcr.io/minimages/traefik"><code>ghcr.io/minimages/traefik</code></a>
</td>

<td>
    <code>3</code>
    <code>3-dev</code>
    <code>3.4</code>
    <code>3.4-dev</code>
    <code>3.4.3</code>
    <code>3.4.3-dev</code>
    <code>latest</code>
    <code>latest-dev</code>
</td>
</tr>

</table>

## Image Configuration

All images run as `nonroot` user with UID/GID 65532. The directory `/src` is provided as the working directory and is owned by the same user.

## Tags
### `-dev` tags
These images contain `busybox` to provide a minimal shell and `apk-tools` to install additional packages.

### Semver tags
The images get tagged with the components of semver version of the upstream package they are based on.

## Verifying Signatures

The images are signed using [cosign](https://github.com/sigstore/cosign). The signature of an image can be verified using the following command:

```bash
cosign verify ghcr.io/minimages/curl \
  --certificate-identity 'https://github.com/minimages/catalog/.github/workflows/build.yml@refs/heads/main' \
  --certificate-oidc-issuer 'https://token.actions.githubusercontent.com'
```
