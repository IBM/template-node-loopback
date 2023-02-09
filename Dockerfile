FROM registry.access.redhat.com/ubi8/nodejs-16-minimal:1

USER 1001

WORKDIR /opt/app-root/src

COPY --chown=1001:1001 . .

RUN ls -lA && npm ci && npm run build

COPY --chown=1001:1001 public public

ENV HOST=0.0.0.0 PORT=3001

EXPOSE ${PORT}
CMD ["npm", "run", "serve"]
