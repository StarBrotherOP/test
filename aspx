<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MonitorStatus.aspx.cs" Inherits="TestWeb1.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <!-- 設定時間更新1秒 -->
             <asp:Timer id="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" />
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:Label ID="Lable1" runat="server" />

            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3" OnItemDataBound="ListView1_ItemDataBound" AllowSorting="">

                <AlternatingItemTemplate>
                    <td runat="server" style="" id="color">
                        <style type="text/css">
                            .red {
                                background-color: red;
                            }

                            .mediumseagreen {
                                background-color: mediumseagreen;
                            }
                        </style>
                        name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                        <br />
                        ip:
                <asp:Label ID="ipLabel" runat="server" Text='<%# Eval("ip") %>' />
                        <br />
                    </td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                        <br />
                        ip:
                <asp:TextBox ID="ipTextBox" runat="server" Text='<%# Bind("ip") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                        <br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>未傳回資料。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                        <br />
                        ip:
                <asp:TextBox ID="ipTextBox" runat="server" Text='<%# Bind("ip") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>

                    

                    <td runat="server" style="" id="color">
                        <style type="text/css">
                            .red {
                                background-color: red;
                            }

                            .mediumseagreen {
                                background-color: mediumseagreen;
                            }
                        </style>
                        name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                        <br />
                        ip:
                <asp:Label ID="ipLabel" runat="server" Text='<%# Eval("ip") %>' />
                        <br />
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="200">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                        <br />
                        ip:
                <asp:Label ID="ipLabel" runat="server" Text='<%# Eval("ip") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:edtwebConnectionString %>" SelectCommand="SELECT [name], [ip] FROM [edtdata] ORDER BY [name]"/>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ListView1" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
