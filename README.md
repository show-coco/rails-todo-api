# Rails Todo API

## GET /api/v1/tasks
`curl http://localhost:3000/api/v1/tasks`

## POST /api/vi/tasks
`curl -X POST http://localhost:3000/api/v1/tasks -d "task[title]=hogehogehoge" `

## PATCH /api/v1/tasks/:id
`curl http://localhost:3000/api/v1/tasks/:id -XPATCH -d "title=aenviaon"`

## DELETE  /api/vi/tasks/:id
`curl http://localhost:3000/api/v1/tasks/:id -XDELETE`