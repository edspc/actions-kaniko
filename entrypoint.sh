#!/busybox/sh

echo "{\"auths\":{\"https://index.docker.io/v1/\":{\"auth\":\"$(echo -n "$DOCKER_AUTH" | base64)\"}}}" > /kaniko/.docker/config.json

echo "From: $BUILD_DOCKERFILE *** TO: $PUBLISH_IMAGE"

/kaniko/executor \
    --force \
    --context "$BUILD_CONTEXT" \
    --dockerfile "$BUILD_DOCKERFILE" \
    --destination "$PUBLISH_IMAGE" \
    --single-snapshot \
    --cleanup
