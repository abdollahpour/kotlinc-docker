FROM abodllahpour/kotlinc-docker AS builder
WORKDIR /app
COPY sample.kt .
RUN kotlinc-js -output sample.js -meta-info -module-kind commonjs sample.kt

FROM node:alpine
WORKDIR /app
COPY --from=builder /app/sample.js .
RUN npm install kotlin
CMD ["node", "sample.js"]
