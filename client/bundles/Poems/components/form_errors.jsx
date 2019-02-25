import React from 'react';

export const FormErrors = ({formErrors}) => 
  <div>
    {Object.keys(formErrors).map((field, index) => {
      return(
        formErrors[field].map((error, key) => {
          return(<p> {field} : { error } </p>)
        })
      )})
    }
  </div>
  
