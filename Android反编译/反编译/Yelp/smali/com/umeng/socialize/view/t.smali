.class Lcom/umeng/socialize/view/t;
.super Ljava/lang/Object;
.source "ShareActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/umeng/socialize/view/ShareActivity;


# direct methods
.method constructor <init>(Lcom/umeng/socialize/view/ShareActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/umeng/socialize/view/t;->a:Lcom/umeng/socialize/view/ShareActivity;

    .line 544
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 547
    iget-object v0, p0, Lcom/umeng/socialize/view/t;->a:Lcom/umeng/socialize/view/ShareActivity;

    invoke-virtual {v0}, Lcom/umeng/socialize/view/ShareActivity;->finish()V

    .line 548
    return-void
.end method
