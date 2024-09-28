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
    <code>2.17</code>
    <code>2.17-dev</code>
    <code>2.17.60</code>
    <code>2.17.60-dev</code>
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
    <code>8.10</code>
    <code>8.10-dev</code>
    <code>8.10.1</code>
    <code>8.10.1-dev</code>
    <code>latest</code>
    <code>latest-dev</code>
</td>
</tr>

<tr>

<td>
    <a href="//ghcr.io/minimages/gcloud"><code>ghcr.io/minimages/gcloud</code></a>
</td>

<td>
    <code>494</code>
    <code>494-dev</code>
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
    <code>2.46</code>
    <code>2.46-dev</code>
    <code>2.46.2</code>
    <code>2.46.2-dev</code>
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
    <code>3.1</code>
    <code>3.1-dev</code>
    <code>3.1.4</code>
    <code>3.1.4-dev</code>
    <code>latest</code>
    <code>latest-dev</code>
</td>
</tr>

</table>

## Image Configuration

All images run as non-root user with UID/GID 65532. The directory `/src` is provided as the working directory and is owned by the same user.

## Tags
### `-dev` tags
These images contain `busybox` to provide a minimal shell and `apk-tools` to install additional packages.

### Semver tags
The images get tagged with the components of semver version of the upstream package they are based on.