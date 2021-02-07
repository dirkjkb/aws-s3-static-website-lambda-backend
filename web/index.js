const clickFunction = () => {
    axios.get(baseurl)
        .then((response) => {
            console.log(response.data);
        })
        .catch((error) => {
            console.error(error);
        })
}