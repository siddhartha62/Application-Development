<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="milestone.aspx.cs" Inherits="MilestoneThreeData.milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestone Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.css">
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
            content: '\f072';
            font-family: 'bootstrap-icons';
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

        .grid-style {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin: 25px 0;
            background-color: var(--card-bg);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
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
        }

        .grid-style td {
            padding: 16px 15px;
            border-bottom: 1px solid var(--card-border);
            color: var(--text-light);
            font-size: 0.95rem;
        }

        .grid-style tr:nth-child(even) {
            background-color: rgba(42, 42, 42, 0.5);
        }

        .grid-style tr:hover {
            background-color: rgba(255, 107, 0, 0.08);
        }

        .form-view-container {
            margin-top: 30px;
            padding: 30px;
            background-color: var(--card-bg);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            border: 1px solid var(--card-border);
        }

        .form-insert {
            padding: 70px;
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

        .form-label::before {
            font-family: "bootstrap-icons";
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.2rem;
        }

        .form-label[for*="MILESTONE_ID"]::before { content: "\f4ce"; }
        .form-label[for*="MILESTONE_NAME"]::before { content: "\f5d1"; }
        .form-label[for*="MILESTONE_DUEDATE"]::before { content: "\f1e1"; }
        .form-label[for*="PROJECT_ID"]::before { content: "\f3af"; }

        .form-input {
            padding: 15px 18px;
            background-color: #333;
            border: 1px solid var(--card-border);
            border-radius: 8px;
            color: var(--text-light);
            width: 100%;
            max-width: 400px;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 107, 0, 0.2);
        }

        .button {
            background-color: var(--primary-color);
            color: var(--text-light);
            padding: 14px 28px;
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
        }

        .button:hover {
            background-color: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(255, 107, 0, 0.25);
        }

        .date-format {
            white-space: nowrap;
            min-width: 120px;
        }
    </style>
</head>
<body>
     <!-- Sidebar -->
  <div class="sidebar">
      <div class="sidebar-brand">
          <h2>Project Management</h2>
          <p>Analytics Dashboard</p>
      </div>
      <ul>
                    <li><a href="Dashboard.aspx" ><i class="bi bi-speedometer2"></i> <span>Dashboard</span></a></li>
            <li><a href="User.aspx"><i class="bi bi-people-fill"></i> <span>Users</span></a></li>
            <li><a href="Project.aspx"><i class="bi bi-kanban-fill"></i> <span>Projects</span></a></li>
            <li><a href="Task.aspx"><i class="bi bi-list-check"></i> <span>Tasks</span></a></li>
            <li><a href="Subtask.aspx"><i class="bi bi-card-checklist"></i> <span>Subtasks</span></a></li>
            <li><a href="Milestone.aspx" class="active"><i class="bi bi-flag-fill"></i> <span>Milestones</span></a></li>
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
                <h1 class="title"><i class="bi bi-flag-fill"></i> Milestone Management</h1>
                <div class="actions">
                    <asp:LinkButton ID="RefreshButton" runat="server" CssClass="button">
                        <i class="bi bi-arrow-clockwise"></i> Refresh
                    </asp:LinkButton>
                </div>
            </div>

            <div class="data-container">
    <div class="data-header">
        <h2><i class="bi bi-table"></i> Milestone List</h2>
        <p>Manage all system Milestone Details from here</p>
    </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSource1" CssClass="grid-style">
                <Columns>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="button">
                                <i class="bi bi-pencil-square"></i> Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="button"
                                OnClientClick="return confirm('Are you sure you want to delete this milestone?');">
                                <i class="bi bi-trash"></i> Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="button">
                                <i class="bi bi-check-lg"></i> Update
                            </asp:LinkButton>
                            <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="button">
                                <i class="bi bi-x-lg"></i> Cancel
                            </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="MILESTONE_ID" HeaderText="ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                    <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Name" SortExpression="MILESTONE_NAME" />
                    <asp:BoundField DataField="MILESTONE_DUEDATE" HeaderText="Due Date" SortExpression="MILESTONE_DUEDATE" 
                        DataFormatString="{0:MM/dd/yyyy}" HtmlEncode="false" ItemStyle-CssClass="date-format" />
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" SortExpression="PROJECT_ID" />
                </Columns>
            </asp:GridView>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" 
                DataSourceID="SqlDataSource1" CssClass="form-view-container">
                <EditItemTemplate>
                    <div class="form-edit">
                        <h3><i class="bi bi-pencil-square"></i> Edit Milestone</h3>
                        <div class="form-group">
                            <label class="form-label">Milestone ID:</label>
                            <asp:Label ID="MILESTONE_IDLabel1" runat="server" Text='<%# Eval("MILESTONE_ID") %>' CssClass="form-id"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Milestone Name:</label>
                            <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Due Date:</label>
                            <asp:TextBox ID="MILESTONE_DUEDATETextBox" runat="server" 
                                Text='<%# Bind("MILESTONE_DUEDATE", "{0:yyyy-MM-dd}") %>' 
                                TextMode="Date" CssClass="form-input"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Project ID:</label>
                            <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-actions">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="button">
                                <i class="bi bi-check-lg"></i> Update
                            </asp:LinkButton>
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button">
                                <i class="bi bi-x-lg"></i> Cancel
                            </asp:LinkButton>
                        </div>
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-insert">
                        <h3><i class="bi bi-plus-lg"></i> Add New Milestone</h3>
                        <div class="form-group">
                            <label class="form-label">Milestone ID:</label>
                            <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Milestone Name:</label>
                            <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Due Date:</label>
                            <asp:TextBox ID="MILESTONE_DUEDATETextBox" runat="server" 
                                Text='<%# Bind("MILESTONE_DUEDATE") %>' 
                                TextMode="Date" CssClass="form-input"/>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Project ID:</label>
                            <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' CssClass="form-input"/>
                        </div>
                        <div class="form-actions">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="button">
                                <i class="bi bi-plus-lg"></i> Insert
                            </asp:LinkButton>
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="button">
                                <i class="bi bi-x-lg"></i> Cancel
                            </asp:LinkButton>
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="form-view">
                        <div class="form-actions">
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="button">
                                <i class="bi bi-plus-lg"></i> Add New Milestone
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;MILESTONE&quot; WHERE &quot;MILESTONE_ID&quot; = :original_MILESTONE_ID AND ((&quot;MILESTONE_NAME&quot; = :original_MILESTONE_NAME) OR (&quot;MILESTONE_NAME&quot; IS NULL AND :original_MILESTONE_NAME IS NULL)) AND ((&quot;MILESTONE_DUEDATE&quot; = :original_MILESTONE_DUEDATE) OR (&quot;MILESTONE_DUEDATE&quot; IS NULL AND :original_MILESTONE_DUEDATE IS NULL)) AND ((&quot;PROJECT_ID&quot; = :original_PROJECT_ID) OR (&quot;PROJECT_ID&quot; IS NULL AND :original_PROJECT_ID IS NULL))" 
                InsertCommand="INSERT INTO &quot;MILESTONE&quot; (&quot;MILESTONE_ID&quot;, &quot;MILESTONE_NAME&quot;, &quot;MILESTONE_DUEDATE&quot;, &quot;PROJECT_ID&quot;) VALUES (:MILESTONE_ID, :MILESTONE_NAME, :MILESTONE_DUEDATE, :PROJECT_ID)" 
                OldValuesParameterFormatString="original_{0}" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;MILESTONE_ID&quot;, &quot;MILESTONE_NAME&quot;, &quot;MILESTONE_DUEDATE&quot;, &quot;PROJECT_ID&quot; FROM &quot;MILESTONE&quot;" 
                UpdateCommand="UPDATE &quot;MILESTONE&quot; SET &quot;MILESTONE_NAME&quot; = :MILESTONE_NAME, &quot;MILESTONE_DUEDATE&quot; = :MILESTONE_DUEDATE, &quot;PROJECT_ID&quot; = :PROJECT_ID WHERE &quot;MILESTONE_ID&quot; = :original_MILESTONE_ID AND ((&quot;MILESTONE_NAME&quot; = :original_MILESTONE_NAME) OR (&quot;MILESTONE_NAME&quot; IS NULL AND :original_MILESTONE_NAME IS NULL)) AND ((&quot;MILESTONE_DUEDATE&quot; = :original_MILESTONE_DUEDATE) OR (&quot;MILESTONE_DUEDATE&quot; IS NULL AND :original_MILESTONE_DUEDATE IS NULL)) AND ((&quot;PROJECT_ID&quot; = :original_PROJECT_ID) OR (&quot;PROJECT_ID&quot; IS NULL AND :original_PROJECT_ID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_MILESTONE_ID" Type="Decimal" />
                    <asp:Parameter Name="original_MILESTONE_NAME" Type="String" />
                    <asp:Parameter Name="original_MILESTONE_DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="original_PROJECT_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                    <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                    <asp:Parameter Name="MILESTONE_DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                    <asp:Parameter Name="MILESTONE_DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                    <asp:Parameter Name="original_MILESTONE_ID" Type="Decimal" />
                    <asp:Parameter Name="original_MILESTONE_NAME" Type="String" />
                    <asp:Parameter Name="original_MILESTONE_DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="original_PROJECT_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>