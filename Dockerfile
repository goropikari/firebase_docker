FROM public.ecr.aws/docker/library/node:24.14.0-alpine

RUN apk add --no-cache openjdk25-jre bash
RUN npm install -g firebase-tools@15.9.1

WORKDIR /app
RUN mkdir -p data
COPY firebase.json .

# Firebase Emulator UI, Hub, Logging, Firestore, Auth, Storage ports
EXPOSE 4000 4400 4500 8080 9099 9199

# Add --import and --export-on-exit to enable data persistence
# Since --export-on-exit deletes the destination directory, pointing to a mounted root directory causes errors
# Use a subdirectory to avoid this issue
# ref: https://github.com/firebase/firebase-tools/blob/v15.9.1/src/emulator/hubExport.ts#L156-L160
CMD ["firebase", "emulators:start", "--project", "demo-project", "--import", "./data/export", "--export-on-exit"]
