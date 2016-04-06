
Partial Class usuarios
    Inherits System.Web.UI.Page

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If IsNothing(Session("usuario")) Then
            Response.Redirect("/inicio.aspx")
        End If

    End Sub



    Protected Sub btnCerrar_Click(sender As Object, e As EventArgs) Handles btnCerrar.Click
        Session("usuario") = Nothing
        Response.Redirect("/inicio.aspx")
    End Sub
End Class
