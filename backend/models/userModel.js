	
// import connection
import db from "../config/database.js";
 
// Get All users
export const getusers = (result) => {
    db.query("SELECT * FROM user", (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}
 
// Get Single user
export const getuserById = (email, result) => {
    db.query("SELECT * FROM user WHERE email = ?", [email], (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results[0]);
        }
    });   
}
 
// Insert user to Database
export const insertuser = (data, result) => {
    db.query("INSERT INTO user SET ? ", [data], (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}
 
// Update user to Database
export const updateuserById = (data, id, result) => {
    db.query("UPDATE user SET Nama = ?, No_Handphone = ?, Email = ? WHERE id = ?", [data.Nama, data.No_Handphone, data.Email, id], (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}
 
// Delete user to Database
export const deleteuserById = (id, result) => {
    db.query("DELETE FROM user WHERE id = ?", [id], (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}

export const insertabsen = (data, result) => {
    db.query("INSERT INTO absen (email) values (?) ", [data], (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}

export const getabsens = (result) => {
    db.query("SELECT * FROM absen", (err, results) => {             
        if(err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });   
}