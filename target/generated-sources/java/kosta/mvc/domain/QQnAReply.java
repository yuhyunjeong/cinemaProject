package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QQnAReply is a Querydsl query type for QnAReply
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QQnAReply extends EntityPathBase<QnAReply> {

    private static final long serialVersionUID = 1424207050L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QQnAReply qnAReply = new QQnAReply("qnAReply");

    public final StringPath content = createString("content");

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final QMember member;

    public final QQnABoard qnaBoard;

    public final NumberPath<Long> rno = createNumber("rno", Long.class);

    public QQnAReply(String variable) {
        this(QnAReply.class, forVariable(variable), INITS);
    }

    public QQnAReply(Path<? extends QnAReply> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QQnAReply(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QQnAReply(PathMetadata metadata, PathInits inits) {
        this(QnAReply.class, metadata, inits);
    }

    public QQnAReply(Class<? extends QnAReply> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.member = inits.isInitialized("member") ? new QMember(forProperty("member")) : null;
        this.qnaBoard = inits.isInitialized("qnaBoard") ? new QQnABoard(forProperty("qnaBoard"), inits.get("qnaBoard")) : null;
    }

}

