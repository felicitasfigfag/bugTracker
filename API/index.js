const express = require (`express`);
const app = express();
const PORT = 8080;

app.listen(
    PORT,
    () => console.log(`its alive on http://localhost:${PORT}`)
)

app.use( express.json() )
//req incoming
//res outgoing

app.get(`/worker`, (req, res) => {
    res.status(200).send({
        name: "John",
        age: "27"
    })
})

app.post(`/worker/:id`, (req, res) => {

    const { id } = req.params;
    const { name } = req.body;

    if (!name) {
        res.status(418).send({ message: `We need a name!`})
    }
    res.send({
        worker: `tshirt with your ${name} and ID of ${id}`
    })
})