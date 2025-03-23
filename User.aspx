<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="MilestoneThreeData.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
<style>
    :root {
    --primary-color: #ff6b00;
    --secondary-color: #ff9100;
    --accent-color: #ff5722;
    --dark-color: #1a1a1a;
    --darker-color: #151515;
    --text-light: #ffffff;
    --text-muted: #b0b0b0;
    --card-bg: #242424;
    --card-border: #333333;
    --sidebar-bg: #1a1a1a;
    --sidebar-hover: #292929;
    --orange-glow: rgba(255, 107, 0, 0.1);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #1e1e1e;
    display: flex;
    color: var(--text-light);
}

/* Sidebar Styles */
.sidebar {
    width: 280px;
    background-color: var(--sidebar-bg);
    color: var(--text-light);
    padding: 20px 0;
    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
    height: 100vh;
    position: fixed;
    transition: all 0.3s ease;
    border-right: 1px solid var(--card-border);
    z-index: 100;
}

.sidebar-brand {
    padding: 15px 25px;
    border-bottom: 1px solid var(--card-border);
    margin-bottom: 20px;
}

.sidebar h2 {
    font-size: 1.5rem;
    margin-bottom: 10px;
    font-weight: 600;
    color: var(--primary-color);
}

.sidebar p {
    font-size: 0.9rem;
    opacity: 0.7;
}

.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar ul li {
    margin: 5px 0;
}

.sidebar ul li a {
    color: var(--text-light);
    text-decoration: none;
    padding: 15px 25px;
    display: flex;
    align-items: center;
    transition: all 0.3s ease;
    border-left: 3px solid transparent;
}

.sidebar ul li a:hover, .sidebar ul li a.active {
    background-color: var(--sidebar-hover);
    border-left: 3px solid var(--primary-color);
    color: var(--primary-color);
}

.sidebar ul li a i {
    margin-right: 15px;
    width: 20px;
    text-align: center;
    font-size: 1.2rem;
}

/* Main Content Styles */
.container {
    margin-left: 280px;
    padding: 30px;
    width: calc(100% - 280px);
    background-color: #1e1e1e;
    min-height: 100vh;
}

.header {
    background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
    color: var(--text-light);
    padding: 25px;
    border-radius: 10px;
    margin-bottom: 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.title {
    color: var(--text-light);
    margin: 0;
    font-size: 1.8rem;
    font-weight: 600;
    position: relative;
    padding-left: 40px;
    margin-bottom: 30px;
}

.title::before {
    content: '\f0c0';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    position: absolute;
    left: 0;
    font-size: 1.6rem;
    color: var(--primary-color);
    background-color: rgba(255, 107, 0, 0.15);
    width: 35px;
    height: 35px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Enhanced Grid Styles */
.grid-style {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    margin: 25px 0;
    background-color: var(--card-bg);
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    position: relative;
}

.grid-style::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
}

.grid-style th {
    background-color: rgba(255, 107, 0, 0.2);
    color: var(--primary-color);
    padding: 18px 15px;
    text-align: left;
    font-weight: 500;
    text-transform: uppercase;
    font-size: 0.9rem;
    letter-spacing: 1px;
    border-bottom: 2px solid rgba(255, 107, 0, 0.3);
    position: relative;
}

.grid-style th:first-child {
    border-top-left-radius: 8px;
}

.grid-style th:last-child {
    border-top-right-radius: 8px;
}

.grid-style td {
    padding: 16px 15px;
    border-bottom: 1px solid var(--card-border);
    color: var(--text-light);
    font-size: 0.95rem;
}

.grid-style tr:last-child td {
    border-bottom: none;
}

.grid-style tr:nth-child(even) {
    background-color: rgba(42, 42, 42, 0.5);
}

.grid-style tr:hover {
    background-color: rgba(255, 107, 0, 0.08);
    transform: translateY(-1px);
    transition: all 0.2s ease;
}

/* Add column icons */
.grid-style th:nth-child(2)::before {
    content: '\f007';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    margin-right: 8px;
    color: var(--primary-color);
}

.grid-style th:nth-child(3)::before {
    content: '\f2bb';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    margin-right: 8px;
    color: var(--primary-color);
}

.grid-style th:nth-child(4)::before {
    content: '\f095';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    margin-right: 8px;
    color: var(--primary-color);
}

.grid-style th:nth-child(5)::before {
    content: '\f0e0';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    margin-right: 8px;
    color: var(--primary-color);
}

/* Enhanced Button Styles */
.button {
    background-color: var(--primary-color);
    color: var(--text-light);
    padding: 10px 20px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 500;
    transition: all 0.3s ease;
    text-decoration: none;
    display: inline-block;
    position: relative;
    overflow: hidden;
    margin: 5px;
    box-shadow: 0 4px 10px rgba(255, 107, 0, 0.2);
    min-width: 90px;
    text-align: center;
}

.button::after {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: rgba(255, 255, 255, 0.1);
    transform: rotate(45deg);
    opacity: 0;
    transition: all 0.3s ease;
}

.button:hover {
    background-color: var(--secondary-color);
    transform: translateY(-3px);
    box-shadow: 0 6px 15px rgba(255, 107, 0, 0.25);
}

.button:hover::after {
    opacity: 1;
    top: -20%;
    left: -20%;
}

/* Make edit/delete buttons distinctive */
[commandname="Edit"] {
    background-color: #3498db;
    position: relative;
    padding-left: 32px;
    box-shadow: 0 4px 10px rgba(52, 152, 219, 0.2);
}

[commandname="Edit"]::before {
    content: '\f044';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    position: absolute;
    left: 10px;
}

[commandname="Edit"]:hover {
    background-color: #2980b9;
    box-shadow: 0 6px 15px rgba(52, 152, 219, 0.25);
}

[commandname="Delete"] {
    background-color: #e74c3c;
    position: relative;
    padding-left: 32px;
    box-shadow: 0 4px 10px rgba(231, 76, 60, 0.2);
}

[commandname="Delete"]::before {
    content: '\f2ed';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    position: absolute;
    left: 10px;
}

[commandname="Delete"]:hover {
    background-color: #c0392b;
    box-shadow: 0 6px 15px rgba(231, 76, 60, 0.25);
}

/* Form Styles */
.form-view-container {
    margin-top: 0px;
    padding: 00px;
    background-color: var(--card-bg);
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
    position: relative;
    overflow: hidden;
        top: 0px;
        left: 0px;
        height: 47px;
    }

.form-view-container::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 0px;
    background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
}

.form-group {
    margin-bottom: 20px;
    position: relative;
}

.form-label {
    display: inline-block;
    width: 160px;
    color: var(--primary-color);
    font-weight: 500;
    margin-bottom: 8px;
    position: relative;
    padding-left: 25px;
}

/* Add icons to form labels */
.form-label:has(+ [id*="NAME"])::before,
.form-label:nth-of-type(1)::before {
    content: '\f007';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    position: absolute;
    left: 0;
    color: var(--primary-color);
}

.form-label:has(+ [id*="ID"])::before,
.form-label:nth-of-type(2)::before {
    content: '\f2bb';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    position: absolute;
    left: 0;
    color: var(--primary-color);
}

.form-label:has(+ [id*="CONTACT"])::before,
.form-label:nth-of-type(3)::before {
    content: '\f095';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    position: absolute;
    left: 0;
    color: var(--primary-color);
}

.form-label:has(+ [id*="EMAIL"])::before,
.form-label:nth-of-type(4)::before {
    content: '\f0e0';
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    position: absolute;
    left: 0;
    color: var(--primary-color);
}

.form-input {
    padding: 12px 15px;
    background-color: #333;
    border: 1px solid var(--card-border);
    border-radius: 6px;
    color: var(--text-light);
    width: 100%;
    max-width: 350px;
    transition: all 0.3s ease;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}

.form-input:focus {
    border-color: var(--primary-color);
    outline: none;
    box-shadow: 0 0 0 3px rgba(255, 107, 0, 0.2), inset 0 1px 3px rgba(0, 0, 0, 0.1);
}

.form-input::placeholder {
    color: #999;
}

.form-id {
    padding: 12px 15px;
    background-color: #333;
    border: 1px solid var(--card-border);
    border-radius: 6px;
    color: var(--text-muted);
    display: inline-block;
    width: 100%;
    max-width: 350px;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}

.form-actions {
    margin-top: 25px;
    display: flex;
    gap: 10px;
}

.form-insert {
    padding: 30px;
    margin-bottom: 20px;
}

.form-insert h3 {
    color: var(--primary-color);
    margin-bottom: 35px;
    font-size: 1.5rem;
    font-weight: 500;
    border-bottom: 1px solid var(--card-border);
    padding-bottom: 20px;
    display: flex;
    align-items: center;
}

.form-insert h3 i {
    margin-right: 15px;
    font-size: 1.3rem;
    color: var(--primary-color);
    background-color: rgba(255, 107, 0, 0.15);
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.form-group {
    margin-bottom: 30px;
    position: relative;
}

.form-label {
    display: block;
    width: 100%;
    color: var(--primary-color);
    font-weight: 500;
    margin-bottom: 12px;
    position: relative;
    padding-left: 30px;
    font-size: 1rem;
}

.form-input {
    padding: 15px 18px;
    background-color: #333;
    border: 1px solid var(--card-border);
    border-radius: 8px;
    color: var(--text-light);
    width: 100%;
    transition: all 0.3s ease;
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
    font-size: 1rem;
}

.form-actions {
    margin-top: 35px;
    display: flex;
    gap: 15px;
}

.button {
    padding: 14px 28px;
    font-size: 1rem;
}

.insert-btn {
    background-color: var(--primary-color);
    position: relative;
    padding-left: 45px;
}

.insert-btn i {
    position: absolute;
    left: 20px;
}
        /* Updated Styles for Bootstrap Icons */
.grid-style th:nth-child(2)::before {
    content: "\f47f";  /* Bootstrap icon for person */
    font-family: "bootstrap-icons";
    margin-right: 8px;
    color: var(--primary-color);
}

.grid-style th:nth-child(3)::before {
    content: "\f4ce";  /* Bootstrap icon for ID card */
    font-family: "bootstrap-icons";
    margin-right: 8px;
    color: var(--primary-color);
}

.grid-style th:nth-child(4)::before {
    content: "\f4e7";  /* Bootstrap icon for telephone */
    font-family: "bootstrap-icons";
    margin-right: 8px;
    color: var(--primary-color);
}

.grid-style th:nth-child(5)::before {
    content: "\f32f";  /* Bootstrap icon for envelope */
    font-family: "bootstrap-icons";
    margin-right: 8px;
    color: var(--primary-color);
}

/* Form label icon styles */
.form-label:has(+ [id*="NAME"])::before,
.form-label:nth-of-type(1)::before {
    content: "\f47f";  /* Bootstrap icon for person */
    font-family: "bootstrap-icons";
    position: absolute;
    left: 0;
    color: var(--primary-color);
}

.form-label:has(+ [id*="ID"])::before,
.form-label:nth-of-type(2)::before {
    content: "\f4ce";  /* Bootstrap icon for ID card */
    font-family: "bootstrap-icons";
    position: absolute;
    left: 0;
    color: var(--primary-color);
}

.form-label:has(+ [id*="CONTACT"])::
</style>
</head>
<body>
    <!-- Include Bootstrap Icons CSS in the head section -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
    
    <!-- Sidebar -->
  <div class="sidebar">
      <div class="sidebar-brand">
          <h2>Project Management</h2>
          <p>Analytics Dashboard</p>
      </div>
      <ul>
                     <li><a href="Dashboard.aspx"><i class="bi bi-speedometer2"></i> <span>Dashboard</span></a></li>
            <li><a href="User.aspx" class="active"><i class="bi bi-people-fill"></i> <span>Users</span></a></li>
            <li><a href="Project.aspx"><i class="bi bi-kanban-fill"></i> <span>Projects</span></a></li>
            <li><a href="Task.aspx"><i class="bi bi-list-check"></i> <span>Tasks</span></a></li>
            <li><a href="Subtask.aspx"><i class="bi bi-card-checklist"></i> <span>Subtasks</span></a></li>
            <li><a href="Milestone.aspx"><i class="bi bi-flag-fill"></i> <span>Milestones</span></a></li>
            <li><a href="UserProjects.aspx"><i class="bi bi-person-workspace"></i> <span>Users Project</span></a></li>
<li><a href="UserTasks.aspx"><i class="bi bi-clipboard-check"></i> <span>Users Task</span></a></li>
            <li><a href="UserAndProject.aspx"><i class="bi bi-person-workspace"></i> <span>User Projects</span></a></li>
            <li><a href="TopThreePerformer.aspx"><i class="bi bi-award-fill"></i> <span>Top Performers</span></a></li>
            <li><a href="MilestonProject.aspx"><i class="bi bi-graph-up"></i> <span>Project Milestones</span></a></li>
            
      </ul>
  </div>
    


    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1 class="title"><i class="bi bi-people-fill"></i> User Management</h1>
                <div class="actions">
                    <asp:LinkButton ID="RefreshButton" runat="server" CssClass="button">
                        <i class="bi bi-arrow-clockwise"></i> Refresh
                    </asp:LinkButton>
                </div>
            </div>
            
            <div class="data-container">
                <div class="data-header">
                    <h2><i class="bi bi-table"></i> Users List</h2>
                    <p>Manage all system users from here</p>
                </div>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="USER_ID" DataSourceID="SqlDataSource1" CssClass="grid-style">
                    <Columns>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="button edit-btn">
                                    <i class="bi bi-pencil-square"></i> Edit
                                </asp:LinkButton>
                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="button delete-btn"
                                    OnClientClick="return confirm('Are you sure you want to delete this user?');">
                                    <i class="bi bi-trash"></i> Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="button update-btn">
                                    <i class="bi bi-check-lg"></i> Update
                                </asp:LinkButton>
                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="button cancel-btn">
                                    <i class="bi bi-x-lg"></i> Cancel
                                </asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="USER_NAME" HeaderText="Name" SortExpression="USER_NAME" />
                        <asp:BoundField DataField="USER_ID" HeaderText="ID" ReadOnly="True" SortExpression="USER_ID" />
                        <asp:BoundField DataField="USER_CONTACT" HeaderText="Contact" SortExpression="USER_CONTACT" />
                        <asp:BoundField DataField="USER_EMAIL" HeaderText="Email" SortExpression="USER_EMAIL" />
                    </Columns>
                </asp:GridView>

                <asp:FormView ID="FormView1" runat="server" DataKeyNames="USER_ID" 
                    DataSourceID="SqlDataSource1" CssClass="form-view-container">
                    <EditItemTemplate>
                        <div class="form-edit">
                            <h3><i class="bi bi-pencil-square"></i> Edit User</h3>
                            <div class="form-group">
                                <label class="form-label">Name:</label>
                                <asp:TextBox ID="USER_NAMETextBox" runat="server" Text='<%# Bind("USER_NAME") %>' CssClass="form-input"/>
                            </div>
                            <div class="form-group">
                                <label class="form-label">User ID:</label>
                                <asp:Label ID="USER_IDLabel1" runat="server" Text='<%# Eval("USER_ID") %>' CssClass="form-id"/>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Contact:</label>
                                <asp:TextBox ID="USER_CONTACTTextBox" runat="server" Text='<%# Bind("USER_CONTACT") %>' 
                                    TextMode="Phone" CssClass="form-input" placeholder="Enter numeric contact"/>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Email:</label>
                                <asp:TextBox ID="USER_EMAILTextBox" runat="server" Text='<%# Bind("USER_EMAIL") %>' 
                                    TextMode="Email" CssClass="form-input"/>
                            </div>
                            <div class="form-actions">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="button update-btn">
                                    <i class="bi bi-check-lg"></i> Update
                                </asp:LinkButton>
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button cancel-btn">
                                    <i class="bi bi-x-lg"></i> Cancel
                                </asp:LinkButton>
                            </div>
                        </div>
                    </EditItemTemplate>

                    <InsertItemTemplate>
                        <div class="form-insert">
                            <h3><i class="bi bi-person-plus-fill"></i> Add New User</h3>
                            <div class="form-group">
                                <label class="form-label">Name:</label>
                                <asp:TextBox ID="USER_NAMETextBox" runat="server" Text='<%# Bind("USER_NAME") %>' CssClass="form-input"/>
                            </div>
                            <div class="form-group">
                                <label class="form-label">User ID:</label>
                                <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' CssClass="form-input"/>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Contact:</label>
                                <asp:TextBox ID="USER_CONTACTTextBox" runat="server" Text='<%# Bind("USER_CONTACT") %>' 
                                    TextMode="Phone" CssClass="form-input" placeholder="Numbers only"/>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Email:</label>
                                <asp:TextBox ID="USER_EMAILTextBox" runat="server" Text='<%# Bind("USER_EMAIL") %>' 
                                    TextMode="Email" CssClass="form-input"/>
                            </div>
                            <div class="form-actions">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="button insert-btn">
                                    <i class="bi bi-plus-lg"></i> Insert
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button cancel-btn">
                                    <i class="bi bi-x-lg"></i> Cancel
                                </asp:LinkButton>
                            </div>
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="form-view">
                            
                            <div class="form-actions">
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button new-btn">
                                    <i class="bi bi-plus-lg"></i> Add New User
                                </asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>

                <!-- SqlDataSource remains unchanged -->
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM &quot;User&quot; WHERE &quot;USER_ID&quot; = :original_USER_ID AND ((&quot;USER_NAME&quot; = :original_USER_NAME) OR (&quot;USER_NAME&quot; IS NULL AND :original_USER_NAME IS NULL)) AND ((&quot;USER_CONTACT&quot; = :original_USER_CONTACT) OR (&quot;USER_CONTACT&quot; IS NULL AND :original_USER_CONTACT IS NULL)) AND ((&quot;USER_EMAIL&quot; = :original_USER_EMAIL) OR (&quot;USER_EMAIL&quot; IS NULL AND :original_USER_EMAIL IS NULL))" 
                    InsertCommand="INSERT INTO &quot;User&quot; (&quot;USER_NAME&quot;, &quot;USER_ID&quot;, &quot;USER_CONTACT&quot;, &quot;USER_EMAIL&quot;) VALUES (:USER_NAME, :USER_ID, :USER_CONTACT, :USER_EMAIL)" 
                    OldValuesParameterFormatString="original_{0}" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT &quot;USER_NAME&quot;, &quot;USER_ID&quot;, &quot;USER_CONTACT&quot;, &quot;USER_EMAIL&quot; FROM &quot;User&quot;" 
                    UpdateCommand="UPDATE &quot;User&quot; SET &quot;USER_NAME&quot; = :USER_NAME, &quot;USER_CONTACT&quot; = :USER_CONTACT, &quot;USER_EMAIL&quot; = :USER_EMAIL WHERE &quot;USER_ID&quot; = :original_USER_ID AND ((&quot;USER_NAME&quot; = :original_USER_NAME) OR (&quot;USER_NAME&quot; IS NULL AND :original_USER_NAME IS NULL)) AND ((&quot;USER_CONTACT&quot; = :original_USER_CONTACT) OR (&quot;USER_CONTACT&quot; IS NULL AND :original_USER_CONTACT IS NULL)) AND ((&quot;USER_EMAIL&quot; = :original_USER_EMAIL) OR (&quot;USER_EMAIL&quot; IS NULL AND :original_USER_EMAIL IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_USER_ID" Type="Decimal" />
                        <asp:Parameter Name="original_USER_NAME" Type="String" />
                        <asp:Parameter Name="original_USER_CONTACT" Type="Decimal" />
                        <asp:Parameter Name="original_USER_EMAIL" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="USER_NAME" Type="String" />
                        <asp:Parameter Name="USER_ID" Type="Decimal" />
                        <asp:Parameter Name="USER_CONTACT" Type="Decimal" />
                        <asp:Parameter Name="USER_EMAIL" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="USER_NAME" Type="String" />
                        <asp:Parameter Name="USER_CONTACT" Type="Decimal" />
                        <asp:Parameter Name="USER_EMAIL" Type="String" />
                        <asp:Parameter Name="original_USER_ID" Type="Decimal" />
                        <asp:Parameter Name="original_USER_NAME" Type="String" />
                        <asp:Parameter Name="original_USER_CONTACT" Type="Decimal" />
                        <asp:Parameter Name="original_USER_EMAIL" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>