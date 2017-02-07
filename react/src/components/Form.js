import React from 'react';

const Form = props => {

   return(
   <div className="row search">
     <input id="add-review" type='submit' value="Add New Review" className="btn" onClick={event => {event.preventDefault(), props.handleClicked();}} />
   </div>
 );
};

export default Form;
