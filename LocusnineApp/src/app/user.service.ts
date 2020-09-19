import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { HttpHeaders } from '@angular/common/http';
import { User } from './user';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class UserService {
  url = 'http://localhost:57074/api/user';

  constructor(private http: HttpClient) {

  }

  getAllUsers(pgno: number, pgsize: number, search: string): Observable<User[]> {
    return this.http.get<User[]>(this.url + '/GetUsers?pageno=' + pgno + '&pgsize=' + pgsize+ '&search=' + search);
  }

  getAllUsersCount(search: string): Observable<any> {
    return this.http.get(this.url + '/GetUsersCount?search=' + search);
  }

  getUserByID(Userid: string): Observable<User> {
    return this.http.get<User>(this.url + '/GetUserbyID/' + Userid);
  }

  createUser(User: User): Observable<User> {
    const httpOptions = { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) };
    return this.http.post<User>(this.url + '/CreateUser',
      User, httpOptions);
  }
  updateUser(User: User): Observable<User> {
    const httpOptions = { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) };
    return this.http.put<User>(this.url + '/UpdateUser',
      User, httpOptions);
  }

  deleteUserById(Userid: string): Observable<number> {
    const httpOptions = { headers: new HttpHeaders({ 'Content-Type': 'application/json' }) };
    return this.http.delete<number>(this.url + '/DeleteUser/' + Userid,
      httpOptions);
  }
}
