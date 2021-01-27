import React from 'react';
import axios from 'axios';

const CardBody = () => {
    return(
        <div className="card-body">
        <div id="component-friends-empty"></div>
        <a href="/net/friends">Друзья</a>
        <button type="button" className="btn btn-primary" onClick={inner}>Клик</button>
        </div>
        
    );
}
const inner = () => {
    axios.get('/ajax/component/friends').then((response) => {
        const  htmlElement = document.getElementById('component-friends-empty');
        htmlElement.innerHTML = response.data;
    }).catch((error) => {
        console.log(error);
    });
    
}
export default CardBody;