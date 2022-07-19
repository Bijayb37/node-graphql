// node-graphql/src/index.js

const { ApolloServer } = require("apollo-server")
const { typeDefs } = require("./schema")
const { resolvers } = require("./resolvers")
//get port from dotenv
const port = process.env.PORT || 8080
//create a new server with typeDefs(schema) and the resolvers
const server = new ApolloServer({ resolvers, typeDefs })

server.listen({ port }, () =>
  console.log(`Server runs at: http://localhost:${port}`)
)
