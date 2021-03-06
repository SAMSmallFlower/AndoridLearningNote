.class final Lcom/squareup/okhttp/internal/spdy/Http2$Writer;
.super Ljava/lang/Object;
.source "Http2.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/spdy/FrameWriter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/Http2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Writer"
.end annotation


# instance fields
.field private final client:Z

.field private closed:Z

.field private final hpackBuffer:Lokio/Buffer;

.field private final hpackWriter:Lcom/squareup/okhttp/internal/spdy/Hpack$Writer;

.field private maxFrameSize:I

.field private final sink:Lokio/BufferedSink;


# direct methods
.method constructor <init>(Lokio/BufferedSink;Z)V
    .locals 2
    .parameter "sink"
    .parameter "client"

    .prologue
    .line 371
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 372
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    .line 373
    iput-boolean p2, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->client:Z

    .line 374
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    .line 375
    new-instance v0, Lcom/squareup/okhttp/internal/spdy/Hpack$Writer;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    invoke-direct {v0, v1}, Lcom/squareup/okhttp/internal/spdy/Hpack$Writer;-><init>(Lokio/Buffer;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackWriter:Lcom/squareup/okhttp/internal/spdy/Hpack$Writer;

    .line 376
    const/16 v0, 0x4000

    iput v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->maxFrameSize:I

    .line 377
    return-void
.end method

.method private writeContinuationFrames(IJ)V
    .locals 8
    .parameter "streamId"
    .parameter "byteCount"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    .line 459
    :goto_0
    cmp-long v1, p2, v6

    if-lez v1, :cond_1

    .line 460
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->maxFrameSize:I

    int-to-long v2, v1

    invoke-static {v2, v3, p2, p3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v0, v2

    .line 461
    .local v0, length:I
    int-to-long v2, v0

    sub-long/2addr p2, v2

    .line 462
    const/16 v2, 0x9

    cmp-long v1, p2, v6

    if-nez v1, :cond_0

    const/4 v1, 0x4

    :goto_1
    invoke-virtual {p0, p1, v0, v2, v1}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->frameHeader(IIBB)V

    .line 463
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    int-to-long v4, v0

    invoke-interface {v1, v2, v4, v5}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    goto :goto_0

    .line 462
    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    .line 465
    .end local v0           #length:I
    :cond_1
    return-void
.end method


# virtual methods
.method public declared-synchronized ackSettings(Lcom/squareup/okhttp/internal/spdy/Settings;)V
    .locals 6
    .parameter "peerSettings"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 385
    monitor-enter p0

    :try_start_0
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/io/IOException;

    const-string v5, "closed"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 386
    :cond_0
    :try_start_1
    iget v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->maxFrameSize:I

    invoke-virtual {p1, v4}, Lcom/squareup/okhttp/internal/spdy/Settings;->getMaxFrameSize(I)I

    move-result v4

    iput v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->maxFrameSize:I

    .line 387
    const/4 v1, 0x0

    .line 388
    .local v1, length:I
    const/4 v3, 0x4

    .line 389
    .local v3, type:B
    const/4 v0, 0x1

    .line 390
    .local v0, flags:B
    const/4 v2, 0x0

    .line 391
    .local v2, streamId:I
    invoke-virtual {p0, v2, v1, v3, v0}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->frameHeader(IIBB)V

    .line 392
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 393
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 564
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    .line 565
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v0}, Lokio/BufferedSink;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 566
    monitor-exit p0

    return-void

    .line 564
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized connectionPreface()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 396
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 397
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->client:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    .line 403
    :goto_0
    monitor-exit p0

    return-void

    .line 398
    :cond_1
    :try_start_2
    invoke-static {}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 399
    invoke-static {}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    const-string v1, ">> CONNECTION %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$000()Lokio/ByteString;

    move-result-object v4

    invoke-virtual {v4}, Lokio/ByteString;->hex()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 401
    :cond_2
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-static {}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$000()Lokio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lokio/ByteString;->toByteArray()[B

    move-result-object v1

    invoke-interface {v0, v1}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 402
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized data(ZILokio/Buffer;I)V
    .locals 3
    .parameter "outFinished"
    .parameter "streamId"
    .parameter "source"
    .parameter "byteCount"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 486
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v1, :cond_0

    new-instance v1, Ljava/io/IOException;

    const-string v2, "closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 487
    :cond_0
    const/4 v0, 0x0

    .line 488
    .local v0, flags:B
    if-eqz p1, :cond_1

    const/4 v1, 0x1

    int-to-byte v0, v1

    .line 489
    :cond_1
    :try_start_1
    invoke-virtual {p0, p2, v0, p3, p4}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->dataFrame(IBLokio/Buffer;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 490
    monitor-exit p0

    return-void
.end method

.method dataFrame(IBLokio/Buffer;I)V
    .locals 4
    .parameter "streamId"
    .parameter "flags"
    .parameter "buffer"
    .parameter "byteCount"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 493
    const/4 v0, 0x0

    .line 494
    .local v0, type:B
    invoke-virtual {p0, p1, p4, v0, p2}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->frameHeader(IIBB)V

    .line 495
    if-lez p4, :cond_0

    .line 496
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    int-to-long v2, p4

    invoke-interface {v1, p3, v2, v3}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    .line 498
    :cond_0
    return-void
.end method

.method public declared-synchronized flush()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 380
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 381
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v0}, Lokio/BufferedSink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 382
    monitor-exit p0

    return-void
.end method

.method frameHeader(IIBB)V
    .locals 5
    .parameter "streamId"
    .parameter "length"
    .parameter "type"
    .parameter "flags"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 569
    invoke-static {}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$100()Ljava/util/logging/Logger;

    move-result-object v0

    invoke-static {v3, p1, p2, p3, p4}, Lcom/squareup/okhttp/internal/spdy/Http2$FrameLogger;->formatHeader(ZIIBB)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 570
    :cond_0
    iget v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->maxFrameSize:I

    if-le p2, v0, :cond_1

    .line 571
    const-string v0, "FRAME_SIZE_ERROR length > %d: %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->maxFrameSize:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    #calls: Lcom/squareup/okhttp/internal/spdy/Http2;->illegalArgument(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 573
    :cond_1
    const/high16 v0, -0x8000

    and-int/2addr v0, p1

    if-eqz v0, :cond_2

    const-string v0, "reserved bit set: %s"

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    #calls: Lcom/squareup/okhttp/internal/spdy/Http2;->illegalArgument(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    invoke-static {v0, v1}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 574
    :cond_2
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    #calls: Lcom/squareup/okhttp/internal/spdy/Http2;->writeMedium(Lokio/BufferedSink;I)V
    invoke-static {v0, p2}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$600(Lokio/BufferedSink;I)V

    .line 575
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    and-int/lit16 v1, p3, 0xff

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 576
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    and-int/lit16 v1, p4, 0xff

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 577
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    const v1, 0x7fffffff

    and-int/2addr v1, p1

    invoke-interface {v0, v1}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 578
    return-void
.end method

.method public declared-synchronized goAway(ILcom/squareup/okhttp/internal/spdy/ErrorCode;[B)V
    .locals 6
    .parameter "lastGoodStreamId"
    .parameter "errorCode"
    .parameter "debugData"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 533
    monitor-enter p0

    :try_start_0
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/io/IOException;

    const-string v5, "closed"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 534
    :cond_0
    :try_start_1
    iget v4, p2, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->httpCode:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_1

    const-string v4, "errorCode.httpCode == -1"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    #calls: Lcom/squareup/okhttp/internal/spdy/Http2;->illegalArgument(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object v4

    throw v4

    .line 535
    :cond_1
    array-length v4, p3

    add-int/lit8 v1, v4, 0x8

    .line 536
    .local v1, length:I
    const/4 v3, 0x7

    .line 537
    .local v3, type:B
    const/4 v0, 0x0

    .line 538
    .local v0, flags:B
    const/4 v2, 0x0

    .line 539
    .local v2, streamId:I
    invoke-virtual {p0, v2, v1, v3, v0}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->frameHeader(IIBB)V

    .line 540
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4, p1}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 541
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    iget v5, p2, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->httpCode:I

    invoke-interface {v4, v5}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 542
    array-length v4, p3

    if-lez v4, :cond_2

    .line 543
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4, p3}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 545
    :cond_2
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 546
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized headers(ILjava/util/List;)V
    .locals 2
    .parameter "streamId"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/spdy/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 421
    .local p2, headerBlock:Ljava/util/List;,"Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 422
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0, v0, p1, p2}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->headers(ZILjava/util/List;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 423
    monitor-exit p0

    return-void
.end method

.method headers(ZILjava/util/List;)V
    .locals 10
    .parameter "outFinished"
    .parameter "streamId"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/spdy/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 443
    .local p3, headerBlock:Ljava/util/List;,"Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    iget-boolean v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v5, :cond_0

    new-instance v5, Ljava/io/IOException;

    const-string v6, "closed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 444
    :cond_0
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-eqz v5, :cond_1

    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    throw v5

    .line 445
    :cond_1
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackWriter:Lcom/squareup/okhttp/internal/spdy/Hpack$Writer;

    invoke-virtual {v5, p3}, Lcom/squareup/okhttp/internal/spdy/Hpack$Writer;->writeHeaders(Ljava/util/List;)V

    .line 447
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v0

    .line 448
    .local v0, byteCount:J
    iget v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->maxFrameSize:I

    int-to-long v6, v5

    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v3, v6

    .line 449
    .local v3, length:I
    const/4 v4, 0x1

    .line 450
    .local v4, type:B
    int-to-long v6, v3

    cmp-long v5, v0, v6

    if-nez v5, :cond_4

    const/4 v2, 0x4

    .line 451
    .local v2, flags:B
    :goto_0
    if-eqz p1, :cond_2

    or-int/lit8 v5, v2, 0x1

    int-to-byte v2, v5

    .line 452
    :cond_2
    invoke-virtual {p0, p2, v3, v4, v2}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->frameHeader(IIBB)V

    .line 453
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    int-to-long v8, v3

    invoke-interface {v5, v6, v8, v9}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    .line 455
    int-to-long v6, v3

    cmp-long v5, v0, v6

    if-lez v5, :cond_3

    int-to-long v6, v3

    sub-long v6, v0, v6

    invoke-direct {p0, p2, v6, v7}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->writeContinuationFrames(IJ)V

    .line 456
    :cond_3
    return-void

    .line 450
    .end local v2           #flags:B
    :cond_4
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public maxDataLength()I
    .locals 1

    .prologue
    .line 481
    iget v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->maxFrameSize:I

    return v0
.end method

.method public declared-synchronized ping(ZII)V
    .locals 6
    .parameter "ack"
    .parameter "payload1"
    .parameter "payload2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 520
    monitor-enter p0

    :try_start_0
    iget-boolean v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/io/IOException;

    const-string v5, "closed"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 521
    :cond_0
    const/16 v1, 0x8

    .line 522
    .local v1, length:I
    const/4 v3, 0x6

    .line 523
    .local v3, type:B
    if-eqz p1, :cond_1

    const/4 v0, 0x1

    .line 524
    .local v0, flags:B
    :goto_0
    const/4 v2, 0x0

    .line 525
    .local v2, streamId:I
    :try_start_1
    invoke-virtual {p0, v2, v1, v3, v0}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->frameHeader(IIBB)V

    .line 526
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4, p2}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 527
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4, p3}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 528
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v4}, Lokio/BufferedSink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 529
    monitor-exit p0

    return-void

    .line 523
    .end local v0           #flags:B
    .end local v2           #streamId:I
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized pushPromise(IILjava/util/List;)V
    .locals 10
    .parameter "streamId"
    .parameter "promisedStreamId"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/spdy/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 427
    .local p3, requestHeaders:Ljava/util/List;,"Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v5, :cond_0

    new-instance v5, Ljava/io/IOException;

    const-string v6, "closed"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 428
    :cond_0
    :try_start_1
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-eqz v5, :cond_1

    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    throw v5

    .line 429
    :cond_1
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackWriter:Lcom/squareup/okhttp/internal/spdy/Hpack$Writer;

    invoke-virtual {v5, p3}, Lcom/squareup/okhttp/internal/spdy/Hpack$Writer;->writeHeaders(Ljava/util/List;)V

    .line 431
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    invoke-virtual {v5}, Lokio/Buffer;->size()J

    move-result-wide v0

    .line 432
    .local v0, byteCount:J
    iget v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->maxFrameSize:I

    add-int/lit8 v5, v5, -0x4

    int-to-long v6, v5

    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v3, v6

    .line 433
    .local v3, length:I
    const/4 v4, 0x5

    .line 434
    .local v4, type:B
    int-to-long v6, v3

    cmp-long v5, v0, v6

    if-nez v5, :cond_3

    const/4 v2, 0x4

    .line 435
    .local v2, flags:B
    :goto_0
    add-int/lit8 v5, v3, 0x4

    invoke-virtual {p0, p1, v5, v4, v2}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->frameHeader(IIBB)V

    .line 436
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    const v6, 0x7fffffff

    and-int/2addr v6, p2

    invoke-interface {v5, v6}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 437
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->hpackBuffer:Lokio/Buffer;

    int-to-long v8, v3

    invoke-interface {v5, v6, v8, v9}, Lokio/BufferedSink;->write(Lokio/Buffer;J)V

    .line 439
    int-to-long v6, v3

    cmp-long v5, v0, v6

    if-lez v5, :cond_2

    int-to-long v6, v3

    sub-long v6, v0, v6

    invoke-direct {p0, p1, v6, v7}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->writeContinuationFrames(IJ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 440
    :cond_2
    monitor-exit p0

    return-void

    .line 434
    .end local v2           #flags:B
    :cond_3
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public declared-synchronized rstStream(ILcom/squareup/okhttp/internal/spdy/ErrorCode;)V
    .locals 5
    .parameter "streamId"
    .parameter "errorCode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 469
    monitor-enter p0

    :try_start_0
    iget-boolean v3, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v3, :cond_0

    new-instance v3, Ljava/io/IOException;

    const-string v4, "closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 470
    :cond_0
    :try_start_1
    iget v3, p2, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->spdyRstCode:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 472
    :cond_1
    const/4 v1, 0x4

    .line 473
    .local v1, length:I
    const/4 v2, 0x3

    .line 474
    .local v2, type:B
    const/4 v0, 0x0

    .line 475
    .local v0, flags:B
    invoke-virtual {p0, p1, v1, v2, v0}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->frameHeader(IIBB)V

    .line 476
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    iget v4, p2, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->httpCode:I

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 477
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 478
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized settings(Lcom/squareup/okhttp/internal/spdy/Settings;)V
    .locals 8
    .parameter "settings"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 501
    monitor-enter p0

    :try_start_0
    iget-boolean v6, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v6, :cond_0

    new-instance v6, Ljava/io/IOException;

    const-string v7, "closed"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 502
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/squareup/okhttp/internal/spdy/Settings;->size()I

    move-result v6

    mul-int/lit8 v3, v6, 0x6

    .line 503
    .local v3, length:I
    const/4 v5, 0x4

    .line 504
    .local v5, type:B
    const/4 v0, 0x0

    .line 505
    .local v0, flags:B
    const/4 v4, 0x0

    .line 506
    .local v4, streamId:I
    invoke-virtual {p0, v4, v3, v5, v0}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->frameHeader(IIBB)V

    .line 507
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    const/16 v6, 0xa

    if-ge v1, v6, :cond_4

    .line 508
    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/internal/spdy/Settings;->isSet(I)Z

    move-result v6

    if-nez v6, :cond_1

    .line 507
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 509
    :cond_1
    move v2, v1

    .line 510
    .local v2, id:I
    const/4 v6, 0x4

    if-ne v2, v6, :cond_3

    const/4 v2, 0x3

    .line 512
    :cond_2
    :goto_2
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v6, v2}, Lokio/BufferedSink;->writeShort(I)Lokio/BufferedSink;

    .line 513
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/internal/spdy/Settings;->get(I)I

    move-result v7

    invoke-interface {v6, v7}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    goto :goto_1

    .line 511
    :cond_3
    const/4 v6, 0x7

    if-ne v2, v6, :cond_2

    const/4 v2, 0x4

    goto :goto_2

    .line 515
    .end local v2           #id:I
    :cond_4
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v6}, Lokio/BufferedSink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 516
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized synReply(ZILjava/util/List;)V
    .locals 2
    .parameter "outFinished"
    .parameter "streamId"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/spdy/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 415
    .local p3, headerBlock:Ljava/util/List;,"Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 416
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->headers(ZILjava/util/List;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 417
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized synStream(ZZIILjava/util/List;)V
    .locals 2
    .parameter "outFinished"
    .parameter "inFinished"
    .parameter "streamId"
    .parameter "associatedStreamId"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZII",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/internal/spdy/Header;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 408
    .local p5, headerBlock:Ljava/util/List;,"Ljava/util/List<Lcom/squareup/okhttp/internal/spdy/Header;>;"
    monitor-enter p0

    if-eqz p2, :cond_0

    :try_start_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 409
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v0, :cond_1

    new-instance v0, Ljava/io/IOException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 410
    :cond_1
    invoke-virtual {p0, p1, p3, p5}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->headers(ZILjava/util/List;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 411
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized windowUpdate(IJ)V
    .locals 8
    .parameter "streamId"
    .parameter "windowSizeIncrement"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 550
    monitor-enter p0

    :try_start_0
    iget-boolean v3, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->closed:Z

    if-eqz v3, :cond_0

    new-instance v3, Ljava/io/IOException;

    const-string v4, "closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 551
    :cond_0
    const-wide/16 v4, 0x0

    cmp-long v3, p2, v4

    if-eqz v3, :cond_1

    const-wide/32 v4, 0x7fffffff

    cmp-long v3, p2, v4

    if-lez v3, :cond_2

    .line 552
    :cond_1
    :try_start_1
    const-string v3, "windowSizeIncrement == 0 || windowSizeIncrement > 0x7fffffffL: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 553
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    .line 552
    #calls: Lcom/squareup/okhttp/internal/spdy/Http2;->illegalArgument(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    invoke-static {v3, v4}, Lcom/squareup/okhttp/internal/spdy/Http2;->access$500(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object v3

    throw v3

    .line 555
    :cond_2
    const/4 v1, 0x4

    .line 556
    .local v1, length:I
    const/16 v2, 0x8

    .line 557
    .local v2, type:B
    const/4 v0, 0x0

    .line 558
    .local v0, flags:B
    invoke-virtual {p0, p1, v1, v2, v0}, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->frameHeader(IIBB)V

    .line 559
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    long-to-int v4, p2

    invoke-interface {v3, v4}, Lokio/BufferedSink;->writeInt(I)Lokio/BufferedSink;

    .line 560
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Http2$Writer;->sink:Lokio/BufferedSink;

    invoke-interface {v3}, Lokio/BufferedSink;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 561
    monitor-exit p0

    return-void
.end method
