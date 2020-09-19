import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { User } from '../user';
import { Observable } from 'rxjs';
import { UserService } from '../user.service'

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  allUsers: Observable<User[]>;
  userForm: any;
  display = 'none';
  userIDForUpdate;
  useremailForUpdate;
  userstatusForUpdate;
  dataSaved = false;
  message = null;
  searchTerm: string ="";

  pageno = 1;
  pagesize = 10;
  pageField = [];
  totalusercount: any;
  paginationCount: number;
  constructor(private formbulider: FormBuilder, private userService: UserService) { }

  ngOnInit(): void {
    this.userForm = this.formbulider.group({
      Name: ['', [Validators.required]],
      Role: ['Admin', [Validators.required]],
      MobileNumber: ['']
    });
    this.loadUsers();
  }

  loadUsers() {
    this.allUsers = this.userService.getAllUsers(this.pageno, this.pagesize, this.searchTerm);
    this.userService.getAllUsersCount(this.searchTerm).subscribe((cnt: any) => {
      this.totalusercount = cnt;
      this.paginationCount = Math.ceil(Number(this.totalusercount / this.pagesize));

      this.pageField = [];
      for (var a = 0; a < this.paginationCount; a++) {
        this.pageField[a] = a + 1;
      }
    })

  }

  jumpToPage(page) {
    this.pageno = page;
    this.loadUsers();
  }

  onFormSubmit() {
    const user = this.userForm.value;
    this.dataSaved = false;
    this.CreateEmployee(user);
  }

  loadUserToEdit(userID: string) {
    this.userService.getUserByID(userID).subscribe(user => {
      this.userIDForUpdate = userID;
      this.useremailForUpdate = user.Email;
      this.userstatusForUpdate = user.Status;
      this.userForm.controls['Name'].setValue(user.Name);
      // this.userForm.controls['Email'].setValue(user.Email);
      this.userForm.controls['MobileNumber'].setValue(user.MobileNumber);
      this.userForm.controls['Role'].setValue(user.Role);
    });

  }

  CreateEmployee(user: User) {
    if (this.userIDForUpdate == null) {
      this.userService.createUser(user).subscribe(
        () => {
          this.loadUsers();
          this.userIDForUpdate = null;
          this.hide();
          this.dataSaved = true;
          this.message = 'User saved successfully.';
          this.resetForm();
        }
      );
    }
    else {
      user.ID = this.userIDForUpdate;
      user.Email = this.useremailForUpdate;
      user.Status = this.userstatusForUpdate;
      this.userService.updateUser(user).subscribe(() => {
        this.loadUsers();
        this.userIDForUpdate = null;
        this.useremailForUpdate = null;
        this.userstatusForUpdate = null;
        this.hide();
        this.dataSaved = true;
        this.message = 'User updated successfully.';
        this.resetForm();
      });
    }
  }

  resetForm() {
    this.userForm.reset();
    this.dataSaved = false;
    this.message = null;
  }

  show(userID: string) {
    if (userID != "0") {
      this.loadUserToEdit(userID);
    }
    this.display = 'block';
  }

  hide() {
    this.resetForm();
    this.display = 'none';
  }

  showSearchedUsers(search: string) {
    this.searchTerm = search;
    this.pageno = 1;
    this.loadUsers();
  }
}
