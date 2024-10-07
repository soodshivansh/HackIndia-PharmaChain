import React, { useEffect, useState } from 'react';
import { auth, firestore } from '../firebase/firebase.js';
import Sidebar from './Sidebar.js';

function UserHome() {

  return (
    <>
      <Sidebar firstName={"shivansh"} lastName={"sood"} />
    </>
  )
}

export default UserHome;