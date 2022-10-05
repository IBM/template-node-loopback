FROM registry.access.redhat.com/ubi8/nodejs-16:1-42

USER default

WORKDIR /opt/app-root/src

COPY --chown=default . .

RUN ls -lA && npm ci && npm run build

COPY --chown=default public public

ENV HOST=0.0.0.0 PORT=3001

EXPOSE ${PORT}
CMD ["npm", "run", "serve"]
