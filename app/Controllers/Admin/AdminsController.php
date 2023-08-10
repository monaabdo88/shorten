<?php 
namespace App\Controllers\Admin;
use App\Models\Admin;
use Phplite\Http\Request;
use Phplite\Session\Session;
use Phplite\Validation\Validate;
class AdminsController{
    /**
     * Get all Admins List
     * @return Phplite\View\View
     */
    public function index()
    {
        $title = "Admins";
        $admins = Admin::get();
        return view('admin.admins.index',['title'=> $title , 'admins'=> $admins]);
    }
    /**
     * Create New Admin
     * @return Phplite\View\View
     */
    public function create()
    {
        $title = "Add New Admin";
        return view('admin.admins.create',['title'=>$title]);
    }
    /**
     * Create New Admin Function
     * @return Phplite\Url\Url
     */
    public function store()
    {
        Validate::validate([
            'first_name' => 'required|min:2|max:30',
            'last_name' => 'required|min:2|max:30',
            'user_name' => 'required|min:2|max:30|unique:admins,user_name',
            'password' => 'required|min:6|max:50',
        ], false);

        Admin::insert([
            'first_name' => Request::post('first_name'),
            'last_name' => Request::post('last_name'),
            'user_name' => Request::post('user_name'),
            'password' => password_hash(Request::post('password'), PASSWORD_BCRYPT)
        ]);

        Session::set('message', "The admin is created successfully");
        return redirect(url('admin-panel/admins'));
    }
    /**
     * Edit Admin by the given id
     *
     * @param string $id
     * @return \Phplite\View\View
     */
    public function edit($id) {
        $admin = Admin::where('id', '=', $id)->first();
        if (! $admin) {
            Session::set('message', 'The Admins is not found');
            return redirect(url('admin-panel/admins'));
        }

        $title = "Edit " . $admin->first_name;
        return view('admin.admins.edit', ['admin' => $admin, 'title' => $title]);
    }

    /**
     * Update existing Admin
     *
     * @param string $id
     * @return \Phplite\Url\Url
     */
    public function update($id) {
        $Admin = Admin::where('id', '=', $id)->first();
        if (! $Admin) {
            Session::set('message', 'The Admin is not found');
            return redirect(url('admin-panel/Admins'));
        }

        Validate::validate([
            'first_name' => 'required|min:2|max:30',
            'last_name' => 'required|min:2|max:30',
            'user_name' => 'required|min:2|max:30|unique:admins,user_name,'.$Admin->user_name,
            'password' => 'min:6|max:50',
        ], false);

        $data = [
            'first_name' => Request::post('first_name'),
            'last_name' => Request::post('last_name'),
            'user_name' => Request::post('user_name')
        ];
        $data = (Request::post('password')) ? array_merge($data, ['password' => password_hash(Request::post('password'), PASSWORD_BCRYPT)]) : $data;

        Admin::where('id', '=', $id)->update($data);

        Session::set('message', "The Admin is updated successfully");
        return redirect(url('admin-panel/admins'));
    }
    /**
     * Edit Admin
     * @param int ID
     * @return Phplite\View\View
     */
    /*public function edit($id)
    {
        $admin = Admin::where('id','=',$id)->first();
        if (! $admin) {
            Session::set('message', 'The admin is not found');
            return redirect(url('admin-panel/admins'));
        }
        Validate::validate([
            'first_name' => 'required|min:2|max:30',
            'last_name' => 'required|min:2|max:30',
            'user_name' => 'required|min:2|max:30|unique:admins,user_name,'.$admin->user_name,
            'password' => 'min:6|max:50',
        ], false);

        $data = [
            'first_name' => Request::post('first_name'),
            'last_name' => Request::post('last_name'),
            'user_name' => Request::post('user_name')
        ];
        $data = (Request::post('password')) ? array_merge($data, ['password' => password_hash(Request::post('password'), PASSWORD_BCRYPT)]) : $data;

        Admin::where('id', '=', $id)->update($data);

        Session::set('message', "The admin is updated successfully");
        return redirect(url('admin-panel/admins'));
    }
    /**
     * Delete Admin
     * @param int id
     * @return Phplite\Url\Url
     */
    public function delete($id)
    {
        $admin = Admin::where('id', '=', $id)->first();
        if (! $admin) {
            Session::set('message', 'The admin is not found');
            return redirect(url('admin-panel/admins'));
        }

        Admin::where('id', '=', $id)->delete();
        Session::set('message', 'The admin is deleted successfully');
        return redirect(url('admin-panel/admins'));
    }
}