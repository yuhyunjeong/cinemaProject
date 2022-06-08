package kosta.mvc.domain;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QMember is a Querydsl query type for Member
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QMember extends EntityPathBase<Member> {

    private static final long serialVersionUID = -812756770L;

    public static final QMember member = new QMember("member1");

    public final DateTimePath<java.util.Date> birth = createDateTime("birth", java.util.Date.class);

    public final NumberPath<Integer> grade = createNumber("grade", Integer.class);

    public final StringPath id = createString("id");

    public final StringPath name = createString("name");

    public final ListPath<Orders, QOrders> orderList = this.<Orders, QOrders>createList("orderList", Orders.class, QOrders.class, PathInits.DIRECT2);

    public final StringPath password = createString("password");

    public final StringPath phone = createString("phone");

    public final NumberPath<Integer> point = createNumber("point", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> regdate = createDateTime("regdate", java.time.LocalDateTime.class);

    public QMember(String variable) {
        super(Member.class, forVariable(variable));
    }

    public QMember(Path<? extends Member> path) {
        super(path.getType(), path.getMetadata());
    }

    public QMember(PathMetadata metadata) {
        super(Member.class, metadata);
    }

}

