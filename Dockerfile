# # Use the official Node.js 18.x image as the base image
# FROM registry.access.redhat.com/ubi8/nodejs-18:1

# # Install git
# # RUN apk add --no-cache git

# # Set the working directory
# WORKDIR /app
# USER root

 

# COPY --chown=1001:0 package*.json ./

 

# USER 1001

 

# ENV key=value

# RUN npm install -g npm
# # Copy the package.json and package-lock.json files
# COPY package*.json ./
# COPY . .
# COPY fire-starters-0.0.1.tgz .


# # RUN npm update npm
# # Clear npm cache and install Vitepress v1.0.0-beta.6 and other dependencies
# RUN npm install

# # Install specific packages @popperjs/core, moment, and lodash
# RUN npm install @popperjs/core moment lodash

# # Copy the rest of the project files

# ENV NODE_OPTIONS="--max-old-space-size=12288"

 

# # Change user to root before changing ownership of .eslintcache

# USER root

 

# RUN mkdir -p /app/node_modules/.cache/.eslintcache

 

# RUN chown 1001:0 /app/node_modules/.cache/.eslintcache

 

# RUN chmod 777 /app/node_modules/.cache/.eslintcache

 

# # Change user back to node

# USER 1001

 



# # Expose the port that Vitepress will run on (port 5000)
# EXPOSE 5000

# # Start the Vitepress development server on port 5000
# CMD ["npm", "run", "docs:dev", "--", "--host", "0.0.0.0", "--port", "5000"]



FROM registry.access.redhat.com/ubi8/nodejs-18:1

WORKDIR /app

USER root

COPY --chown=1001:0 package*.json ./

COPY --chown=1001:0 fire-starters-0.0.1.tgz .

RUN npm install -g npm

RUN npm install 

RUN npm install vitepress@1.0.0-beta.6

RUN npm install @popperjs/core moment lodash

COPY . .

ENV NODE_OPTIONS="--max-old-space-size=12288"

USER root

RUN mkdir -p /app/node_modules/@esbuild/android-arm

RUN chown 1001:0 /app/node_modules/@esbuild/android-arm

RUN chmod 777 /app/node_modules/@esbuild/android-arm

# Build the Vitepress project

RUN npm run docs:build

# Expose the port that Vitepress will run on (port 5000)

EXPOSE 5000

# Start the Vitepress development server on port 5000

CMD ["npm", "run", "docs:dev", "--", "--host", "0.0.0.0", "--port", "5000"]