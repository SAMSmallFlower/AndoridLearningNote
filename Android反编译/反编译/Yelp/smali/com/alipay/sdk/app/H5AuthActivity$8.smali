.class Lcom/alipay/sdk/app/H5AuthActivity$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field final synthetic a:Lcom/alipay/sdk/app/H5AuthActivity;


# direct methods
.method constructor <init>(Lcom/alipay/sdk/app/H5AuthActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 418
    iput-object p1, p0, Lcom/alipay/sdk/app/H5AuthActivity$8;->a:Lcom/alipay/sdk/app/H5AuthActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 422
    iget-object v0, p0, Lcom/alipay/sdk/app/H5AuthActivity$8;->a:Lcom/alipay/sdk/app/H5AuthActivity;

    invoke-virtual {v0}, Lcom/alipay/sdk/app/H5AuthActivity;->finish()V

    .line 424
    return-void
.end method
