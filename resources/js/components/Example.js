import React from 'react';
import ReactDOM from 'react-dom';
import CardBody from './CardBody';
import CardHeader from './CardHeader';

function Example() {
    return (
        <div className="container">
            <div className="row justify-content-center">
                <div className="col-sm-12">
                    <div className="card">
                        <CardHeader />
                        <CardBody />
                        
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Example;

if (document.getElementById('root')) {
    ReactDOM.render(<Example />, document.getElementById('root'));
}
